#include <GL/glut.h>
#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
#include <inttypes.h>
#include <cmath>
#include <algorithm>
#include <boost/timer.hpp>
#include "arm_neon.h"

using namespace cv;
using namespace std;

int main(int argc, char** argv)
{
  
  Mat imageS (480, 640, CV_8UC3, Scalar(0,0,0));
  Mat imageV (480, 640, CV_8UC3, Scalar(0,0,0));
  namedWindow( "Display windowS", WINDOW_AUTOSIZE );
  namedWindow( "Display windowV", WINDOW_AUTOSIZE );
  uint8_t* srcS = imageS.data;
  uint8_t* srcV = imageV.data;
  int h,s;
  for(int i = 0; i < 256; i++)
    {
      s = i; h = i;
      if (i >= 180)
	{
	  h = 179;
	}
      for (int j = 0; j < imageS.cols; j++)
	{
	  *srcS++ = 100; *srcS++ = s  ; *srcS++ = 255  ;
	  *srcV++ = 100; *srcV++ = 255  ; *srcV++ = s  ;
	}
    }
  cvtColor(imageS,imageS,CV_HSV2BGR);
  cvtColor(imageV,imageV,CV_HSV2BGR);
  imshow( "Display windowS", imageS );
  imshow( "Display windowV", imageV );
  waitKey(0);
      
  return 0;
}
