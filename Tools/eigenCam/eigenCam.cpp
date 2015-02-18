#include <iostream>
#include <Eigen/Core>
#include <Eigen/Dense>
#include "opencv2/opencv.hpp"
#include "Eigen2CV.h"
using namespace cv;
using namespace Eigen;
int main()
{
  ArrayXXd img;

  VideoCapture cap(0); 
  if(!cap.isOpened()) { return -1; }

  namedWindow("Image window",1);
  for(;;)
    {
      cap >> eigen2cv(img); 
      imshow("Image window", eigen2cv(img));
      if(waitKey(1) >= 0) break;
    }
  
  return 0;
}
