#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
#include <cmath>
#include </home/odroid/CV/b4Sight/Tools/testVid/funcs.hpp>

using namespace cv;
using namespace std;

void reference_convert (uint8_t __restrict * dest, uint8_t __restrict * src)
{
  int i;
  int r,g,b;
  int y;
  int n = 640*480;

  for (i=0; i < n; i++)
  {
    b = *src++; 
    g = *src++; 
    r = *src++; 
    y = (r*77)+(g*151)+(b*28);
    *dest++ = (y>>8);
  }
}

void reference_thresh (uint8_t __restrict * dest, uint8_t __restrict * src, int t)
{
  int i;
  int r,g,b;
  int y;
  
  //uint8_t __restrict * dest = output->data;
  //uint8_t __restrict * src  = input->data;
  int n = 640*480;
  for (i=0; i < n; i++)
  {
    b = *src++; 
    g = *src++; 
    r = *src++; 
    y = (r*77)+(g*151)+(b*28);
    *dest++ = (y>>8)&t;
  }
}
