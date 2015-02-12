#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
#include <cmath>
#include "arm_neon.h"

using namespace cv;
using namespace std;

static void convert_neon8px_int(const Mat* input, Mat* output)
{
  uint8_t * dest = output->data;
  uint8_t * src  = input->data;
  int numPixels  = input->total();
  
  register int n = numPixels / 8;
  printf("No of Pixels = %d ; n = %d\n ",numPixels,n);
  uint8x8x3_t rgb;
  uint8x8_t rfac = vdup_n_u8 (77);
  uint8x8_t gfac = vdup_n_u8 (151);
  uint8x8_t bfac = vdup_n_u8 (28);
  uint16x8_t  temp;
  uint8x8_t result;
  
  for (register int i = 0; i < n; i++ )
    {
      rgb  = vld3_u8 (src);
            
      temp = vmull_u8 (rgb.val[0],      bfac);
      temp = vmlal_u8 (temp,rgb.val[1], gfac);
      temp = vmlal_u8 (temp,rgb.val[2], rfac);
      
      result = vshrn_n_u16 (temp, 8);
      vst1_u8 (dest, result);
      
      src  += 8*3;
      dest += 8;
    }
}

int main(void)
{
    Mat image  (480, 640, CV_8UC3, Scalar(255,0,0));
    Mat dest   (480, 640, CV_8UC1, Scalar(0));
    
    image = imread("../test.jpg", IMREAD_COLOR); 
    
    namedWindow( "Display window", WINDOW_AUTOSIZE );
    imshow( "Display window", image );
    waitKey(0);
    convert_neon8px_int( &image  , &dest );
    imshow( "Display window", dest );

    waitKey(0);
    return 0;
    
}
