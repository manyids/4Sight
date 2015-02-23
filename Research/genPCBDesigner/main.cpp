#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
#include <inttypes.h>
#include <cmath>
#include <algorithm>
#include "arm_neon.h"

using namespace cv;
using namespace std;

void CallBackFunc(int event, int x, int y, int flags, void* userdata)
{
     if  ( event == EVENT_LBUTTONDOWN )
     {
          cout << "Left button of the mouse is clicked - position (" << x << ", " << y << ")" << endl;
     }
}

int main(void)
{
  Mat image (480, 640, CV_8UC3, Scalar(0,0,0));
  Mat controls (480, 640, CV_8UC3, Scalar(0,0,0));
  Mat creates (480, 640, CV_8UC3, Scalar(0,0,0));
  Mat solder (480, 640, CV_8UC3, Scalar(0,0,0));
  Mat wires (480, 640, CV_8UC3, Scalar(0,0,0));
  
  namedWindow( "Display window", WINDOW_AUTOSIZE );
  setMouseCallback("Display window", CallBackFunc, NULL);

  imshow( "Display window", image );
  waitKey(0);
  
  return 0;
}
