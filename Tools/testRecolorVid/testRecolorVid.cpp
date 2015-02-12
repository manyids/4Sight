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
    VideoCapture cap(0); 
    if(!cap.isOpened()) return -1; 
    cap.set(CV_CAP_PROP_FRAME_WIDTH, 640);
    cap.set(CV_CAP_PROP_FRAME_HEIGHT, 480);

    Mat image  (480, 640, CV_8UC3, Scalar(0,0,0));
    Mat thresh (480, 640, CV_8UC3, Scalar(0));
    Mat final  (480, 640, CV_8UC3, Scalar(0));
    namedWindow( "Thresh window", WINDOW_AUTOSIZE );

    for(;;)
      {
	cap >> image; 
	int colorSet[8][3] = {{0,0,255},{0,255,0},{255,0,0},{0,255,255},
			      {255,255,0},{255,0,255},{127,0,255},{0,127,127}};	
	final = Scalar(0,0,0);
	for(int i = 0; i<8; i++)
	  {	
	    reference_thresh ( &thresh, &image, pow(2,i), colorSet[7-i] );
	    final += thresh;
	  }
	imshow( "Thresh window", final );
	if (waitKey(1)==27) break;
      }
    return 0;
}
