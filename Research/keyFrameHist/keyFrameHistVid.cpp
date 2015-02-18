#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
#include <inttypes.h>
#include <cmath>
#include "arm_neon.h"

using namespace cv;
using namespace std;

static void do_hist( Mat* input, uint8_t* cT )
{
  static uint8_t __restrict * src  = input->data;
  int numPixels = input->total();
  
  for (int i = 0; i < 256; i++) { *(cT + i) = 0; }
  for (int i = 0; i < numPixels; i++)
    {
      *( cT + *src ) = *( cT + *src ) + 1;
      *src++;
    }
}

int main(void)
{
    Mat image (480, 640, CV_8UC1, Scalar(0));
    uint8_t colorThresh[256];

    image = imread("../test.jpg", IMREAD_GRAYSCALE); 
    
    namedWindow( "Display window", WINDOW_AUTOSIZE );
    imshow( "Display window", image );
    waitKey(0);
    
    do_hist( &image, &colorThresh[0] );
    for (int i = 0; i < 256; i++)
      {
	printf("%d : %" PRIu8 "\n", i, colorThresh[i] );
      }
    waitKey(0);
    return 0;
}
