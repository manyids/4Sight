#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
#include <cmath>

using namespace cv;
using namespace std;

static void reference_convert (Mat *output, Mat *input)
{
  int i;
  int r,g,b;
  int y;
  
  uint8_t __restrict * dest = output->data;
  uint8_t __restrict * src  = input->data;
  int n                     = input->total();
  for (i=0; i < n; i++)
  {
    b = *src++; 
    g = *src++; 
    r = *src++; 
    y = (r*77)+(g*151)+(b*28);
    *dest++ = (y>>8);
  }
};

static void reference_thresh (Mat *output, Mat *input, int t, int color[3])
{
  int i;
  int r,g,b;
  int y;
  
  uint8_t __restrict * dest = output->data;
  uint8_t __restrict * src  = input->data;
  int n                     = input->total();
  for (i=0; i < n; i++)
  {
    b = *src++; 
    g = *src++; 
    r = *src++; 
    y = (r*77)+(g*151)+(b*28);
    *dest++ = ((y>>8)&t)&color[0];
    *dest++ = ((y>>8)&t)&color[1];
    *dest++ = ((y>>8)&t)&color[2];
  }
};

int main(void)
{
    string imageName("test.jpg"); 
    
    Mat image  (480, 640, CV_8UC3, Scalar(0,0,0));
    Mat dest   (480, 640, CV_8UC1, Scalar(0));
    Mat thresh (480, 640, CV_8UC3, Scalar(0));
    Mat final  (480, 640, CV_8UC3, Scalar(0));
    image = imread("test.jpg", IMREAD_COLOR); 
    int colorSet[8][3] = {{0,0,255},{0,255,0},{255,0,0},{0,255,255},
			  {255,255,0},{255,0,255},{127,0,255},{0,127,127}};
    reference_convert( &dest  , &image );
    namedWindow( "Display window", WINDOW_AUTOSIZE );
    imshow( "Display window", image );

    namedWindow( "Thresh window", WINDOW_AUTOSIZE );
    for(int i = 0; i<8; i++)
      {	
	reference_thresh ( &thresh, &image, pow(2,i), colorSet[7-i] );
	final += thresh;
      }
    imshow( "Thresh window", final );
    waitKey(0);
    return 0;
    
}
