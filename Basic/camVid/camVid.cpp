#include "opencv2/opencv.hpp"

using namespace cv;

int main(int, char**)
{
    VideoCapture cap(0); 
    if(!cap.isOpened()) 
        return -1;

    Mat edges;
    namedWindow("edges",1);
    for(;;)
    {
        Mat frame;
        cap >> frame; 
        imshow("Frame", frame);
        if(waitKey(1) >= 0) break;
    }
   
    return 0;
}
