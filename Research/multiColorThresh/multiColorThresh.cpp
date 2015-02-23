#include <opencv2/core/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <boost/archive/binary_oarchive.hpp>
#include <boost/serialization/vector.hpp>
#include <boost/foreach.hpp>
#include <fstream>
#include <ostream>
#include <sstream>
#include <string>
#include <inttypes.h>
#include <cmath>
#include "arm_neon.h"

using namespace cv;
using namespace std;

static void neon_asm_hue( Mat* input, Mat* output )
{
  uint8_t __restrict * dest = output->data;
  uint8_t __restrict * src  = input->data;
  int numPixels  = input->total(); 

  __asm__ volatile(
		   "lsr %2, %2, #3                \n"
		   ".loop:                        \n"
		   "vld3.8   {d0-d2}, [%1]!       \n"
		   "vst1.8  {d0}, [%0]!           \n"
		   "subs %2, %2, #1               \n"
		   "bne .loop                     \n"
		   :
		   : "r"(dest), "r"(src), "r"(numPixels)
		   ); 
}

static void set_bins( uint8_t* cB, uint8_t* rc )
{
  // minB, maxB, minR, maxR, minG, maxG
  //0--> 2^0 = 1
  *cB++ = 0; *cB++ = 20; 
  *cB++ = 0; *cB++ = 255;
  *cB++ = 0; *cB++ = 255;
  *rc++ = 0; *rc++ = 0; *rc++ = 255;
  //1--> 2^1 = 2
  *cB++ = 33; *cB++ = 38; 
  *cB++ = 0; *cB++ = 255; 
  *cB++ = 0; *cB++ = 255;
  *rc++ = 0; *rc++ = 255; *rc++ = 0;
  //2--> 2^2 = 4
  *cB++ = 120; *cB++ = 122; 
  *cB++ = 0; *cB++ = 255; 
  *cB++ = 0; *cB++ = 255;
  *rc++ = 255; *rc++ = 0; *rc++ = 0;
  //3--> 2^3 = 8
  *cB++ = 123; *cB++ = 126; 
  *cB++ = 0; *cB++ = 255; 
  *cB++ = 0; *cB++ = 255;
  *rc++ = 255; *rc++ = 255; *rc++ = 0;
  //4--> 2^4 = 16
  *cB++ = 156; *cB++ = 181; 
  *cB++ = 0; *cB++ = 255;
  *cB++ = 0; *cB++ = 255;
  *rc++ = 0; *rc++ = 255; *rc++ = 255;
  //5--> 2^5 = 32
  *cB++ = 0; *cB++ = 0; 
  *cB++ = 0; *cB++ = 255; 
  *cB++ = 0; *cB++ = 255;
  *rc++ = 255; *rc++ = 0; *rc++ = 255;
  //6--> 2^6 = 64
  *cB++ = 0; *cB++ = 0; 
  *cB++ = 0; *cB++ = 0; 
  *cB++ = 0; *cB++ = 0;
  *rc++ = 0; *rc++ = 0; *rc++ = 0;
  //7--> 2^7 = 128
  *cB++ = 0; *cB++ = 0; 
  *cB++ = 0; *cB++ = 0;
  *cB++ = 0; *cB++ = 0;
  *rc++ = 255; *rc++ = 255; *rc++ = 255;
}

//static void read_bins( uint8_t* cB )

static void set_thresh( uint8_t* cB, uint8_t* cT )
{
  
  for (int i = 0; i < 256; i++)
    {
      *cT++ = 0; *cT++ = 0; *cT++ = 0;
      cT = cT - 3;
      printf("%d : ",i);
      for (int j = 0; j < 3; j++)
	{
	  for (int k = 0; k < 8; k++) 
	    {
	      if ( ( i >= *(cB+(6*k)) )&&( i <= *((cB+(6*k)) + 1) ) ) // 8 bins!!
		{
		  uint8_t mask = 0;
		  mask = 1 << k;
		  *cT = mask|*cT ;
		}
	    }
	  printf("%" PRIu8 ", ", *cT );
	  cB = cB + 2;
	  cT = cT + 1;
	}
      cB = cB - 6;
      printf("\n");
    }
}

static void do_thresh( Mat* input, Mat* output, uint8_t* cT )
{
  static uint8_t __restrict * src  = input->data;
  static uint8_t __restrict * dest = output->data;
  int numPixels = input->total();
  
  for (int i = 0; i < numPixels; i++)
    {
      *dest = (*( cT + *src)); // &(*( cT+1+  *(src+1)))&(*( cT+2  + *(src+2)));
      src = src + 3;
      dest = dest + 1;
    }

}

static void do_recolor( Mat* input, Mat* output, uint8_t* rc )
{
  static uint8_t __restrict * src  = input->data;
  static uint8_t __restrict * dest = output->data;
  int numPixels = input->total();
  
  for (int i = 0; i < numPixels; i++)
    {
      for (int k = 0; k < 8; k++)
	{
	  uint8_t mask = 0;
	  mask = 1 << k;
	  if ( ( (*src) & mask ) == mask )
	    {
	      *dest = *( rc + (k*3) ) ; *(dest+1) = *( rc + (k*3) + 1 ); *(dest+2) = *( rc + (k*3) + 2);
	    }
	}
      dest = dest + 3;
      src  = src  + 1;
    }
}

int main(void)
{
    Mat image  (480, 640, CV_8UC3, Scalar(255,0,0));
    Mat dest   (480, 640, CV_8UC3, Scalar(0,0,0));
    Mat final  (480, 640, CV_8UC1, Scalar(0));
    Mat cHue  (480, 640, CV_8UC1, Scalar(0));
    uint8_t colorBins[8][6];
    uint8_t recolor[8][3];
    uint8_t colorThresh[256][3];

    image = imread("../test.png", IMREAD_COLOR); 
    cvtColor(image, image, COLOR_BGR2HSV);
    neon_asm_hue( &image, &cHue );
    namedWindow( "Display window", WINDOW_AUTOSIZE );
    imshow( "Display window", cHue );
    waitKey(0);

    set_bins( &colorBins[0][0], &recolor[0][0] );
    
    //stringstream stream;
    //string filename( "colorBins.bin" );
    //ofstream ostr( filename.c_str(), ios::binary );
    //boost::archive::binary_oarchive oa( ostr );
    //oa << colorBins;
    set_thresh( &colorBins[0][0], &colorThresh[0][0] );
    do_thresh( &image, &final, &colorThresh[0][0] );
    do_recolor( &final, &dest, &recolor[0][0] );
    namedWindow( "Output window", WINDOW_AUTOSIZE );
    imshow( "Output window", dest );
    waitKey(0);
    return 0;
}
