#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>

using namespace cv;
using namespace std;

typedef void ConversionFunctionPrototype(const Mat& input, Mat& output);

void testConversion(const Mat& input, int numRuns, int& avgTimeInMicroseconds, ConversionFunctionPrototype conversionFn)
{
    assert(input.type() == CV_8UC4);
    assert(input.empty() == false);

    Mat output(input.size(), CV_8UC1);

    double conversionStart, conversionFinish;
    double totalTime = 0;

    for (int i = 0; i < numRuns ; i++)
    {
        conversionStart = (double)getTickCount();
        conversionFn(input, output);
        conversionFinish = (double)getTickCount();

        totalTime += (conversionFinish - conversionStart);
    }

    avgTimeInMicroseconds = (int) ( totalTime /  ( (double)numRuns * getTickFrequency() ) );
}

int main(void)
{
  return 0;
}
