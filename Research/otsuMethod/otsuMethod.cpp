#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <fstream>
#include <string>
#include <inttypes.h>
#include <cmath>
#include <algorithm>
#include "arm_neon.h"

using namespace cv;
using namespace std;

static void do_hist_prob( Mat* input, int* cH, float* pH )
{
  static uint8_t __restrict * src  = input->data;
  int numPixels = input->total();

  for (int i = 0; i < 256; i++) { *(cH + i) = 0; }
  for (int i = 0; i < numPixels; i++)
    {
      *( cH + *src ) = *( cH + *src ) + 1;
      src = src + 3;
    }
  for (int i = 0; i < 256; i++) { *pH = (float)*cH/(float)numPixels; *cH++; *pH++; }
}

static void do_wt( float* pH, float* wtH )
{
  float wt = 0;
  for (int i = 0; i < 256; i++)
    {
      *wtH = wt + *pH;
      wt = *wtH;
      *wtH++; *pH++;
    }
}

static void do_myu( float* pH, float* wtH, float* myu1, float* myu2 )
{
  float t_ip = 0;
  float myu_t = 0;
  
  for (int i = 0; i < 256; i++) { *(myu1 + i) = 0; *(myu2 + i) = 0; }
  
  for (int i = 1; i < 256; i++)
    {
      *myu1 = t_ip + ((float)i)*(*pH);
      t_ip = *myu1;
      *myu1++; *pH++;
    }
  myu_t = *(myu1 - 1);
  myu1 = myu1 - 256;
  
  for (int i = 1; i < 256; i++)
    {
      *myu2 = myu_t - *myu1;
      *myu1++; *myu2++;
    }
  myu1 = myu1 - 256; myu2 = myu2 - 256;
  
  for (int i = 1; i < 256; i++) { *myu1 = (*myu1 / *wtH); *myu1++; *wtH++; }
  wtH = wtH - 256;
  
  for (int i = 1; i < 256; i++) 
    { 
      *myu2 = (*myu2 / (1 - *wtH)); 
      if (*myu2 <= 0) 
	{
	  *myu2 = 0;
	}
      *myu2++; *wtH++; 
    }
  myu1 = myu1 - 256; myu2 = myu2 - 256; wtH = wtH - 256;
  for (int i = 0; i < 256; i++) { printf("%d : %f, %f, %f \n", i, *myu1, *myu2, *wtH); myu1++; myu2++; wtH++; }
}

static void do_sigsq( float* myu1, float* myu2, float* wtH, float* sigsq )
{
  float myu_t;
  printf("%f \n", *myu1);
  myu_t = *(myu1 + 255);
  printf("%f \n", myu_t);
}

int main(void)
{
  Mat image (480, 640, CV_8UC3, Scalar(0,0,0));
  int colorHist[256];
  float probHist[256];
  float wtHist[256];
  float myu1Hist[256];
  float myu2Hist[256];
  float sigsqHist[256];
  image = imread("../test.png", IMREAD_COLOR); 
  cvtColor(image, image, COLOR_BGR2HSV);
  namedWindow( "Display window", WINDOW_AUTOSIZE );
  imshow( "Display window", image );
  waitKey(0);
  
  do_hist_prob( &image, &colorHist[0], &probHist[0] );
  do_wt( &probHist[0], &wtHist[0] );
  do_myu( &probHist[0], &wtHist[0], &myu1Hist[0], &myu2Hist[0] );
  do_sigsq( &myu1Hist[0], &myu2Hist[0] , &wtHist[0], &sigsqHist[0] ); 
  return 0;
}
