#include "opencv2/opencv.hpp"

using namespace cv;

int main(int, char**)
{
    VideoCapture cap(0); 
    if(!cap.isOpened()) 
        return -1;

    Mat frame;
    
    cap >> frame; 
    imshow("Frame", frame);
    waitKey(0);
    return 0;
}
