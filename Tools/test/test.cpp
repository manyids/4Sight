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

static void reference_thresh (Mat *output, Mat *input, int t)
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
    *dest++ = (y>>8)&t;
  }
};

int main(void)
{
    string imageName("test.jpg"); 
    
    Mat image  (480, 640, CV_8UC3, Scalar(0,0,0));
    Mat dest   (480, 640, CV_8UC1, Scalar(0));
    Mat thresh (480, 640, CV_8UC1, Scalar(0));
    image = imread("test.jpg", IMREAD_COLOR); 
    
    reference_convert( &dest  , &image );
    namedWindow( "Display window", WINDOW_AUTOSIZE );
    imshow( "Display window", dest );

    namedWindow( "Thresh window", WINDOW_AUTOSIZE );
    int i = 0;
    for(;;)
      {	
	reference_thresh ( &thresh, &image , pow(2,i) );
	imshow( "Thresh window", thresh );
	int keyP;
	keyP = waitKey(60);
	i++;
	if(i==8) i=0;
	if(keyP==27) break;
      }
    return 0;
    
}
