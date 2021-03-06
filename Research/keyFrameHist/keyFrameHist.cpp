#include <opencv2/core/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <fstream>
#include <string>
#include <inttypes.h>
#include <cmath>
#include <algorithm>
#include "arm_neon.h"

using namespace cv;
using namespace std;

static void draw_hist( int* cH, int* stats, string winName )
{
  int avg = *stats++;
  int exp = *stats++;
  int min = *stats++;
  int max = *stats++;
  int minLoc = *stats++;
  int maxLoc = *stats++;
  Mat hist ( 480, 640, CV_8UC3, Scalar(0,0,0) );
  Point start_old = Point( 62, 430 );
  for (int i = 0; i < 255; i++)
    {
      Point start = Point( 64+(i*2), 430 - ( (*cH)*380/max ) );
      line( hist, start_old, start, Scalar( 0, 0, 255 ), 1, 0 );
      start_old = start;
      *cH++;
    }
  Point startA = Point( 64, 430 - ( (avg)*380/max ) );
  Point endA   = Point( 640-64, 430 - ( (avg)*380/max ) );
  Point startE = Point( 64, 430 - ( (exp)*380/max ) );
  Point endE   = Point( 640-64, 430 - ( (exp)*380/max ) );
  line( hist, startA, endA, Scalar( 255, 0, 0 ), 1, 0 );
  line( hist, startE, endE, Scalar( 0, 255, 0 ), 1, 0 );
  namedWindow( winName, WINDOW_AUTOSIZE );
  imshow( winName, hist );
  waitKey(0);
}

static void do_hist( Mat* input, int* cH, int* cS, int* cV )
{
  static uint8_t __restrict * src  = input->data;
  int numPixels = input->total();
  
  for (int i = 0; i < 256; i++) { *(cH + i) = 0; }
  for (int i = 0; i < 256; i++) { *(cS + i) = 0; }
  for (int i = 0; i < 256; i++) { *(cV + i) = 0; }
  for (int i = 0; i < numPixels; i++)
    {
      *( cH + *src )     = *( cH + *src )     + 1;
      *( cS + *(src+1) ) = *( cS + *(src+1) ) + 1;
      *( cV + *(src+2) ) = *( cV + *(src+2) ) + 1;
      src = src + 3;
    }
}

static void do_stats( int* cH, int* s, int len )
{
  int sum = 0;
  int exp = 0;
  int min = *cH;
  int max = *cH;
  int minLoc = 0;
  int maxLoc = 0;
  for (int i = 0; i < len; i++)
    {
      sum = sum + *cH;
      exp = exp + (*cH)*(i);
      if ( *cH < min ) { min = *cH; minLoc = i; }
      if ( *cH > max ) { max = *cH; maxLoc = i; }
      *cH++;
    }
  *s++ = sum/len;
  *s++ = exp/( (len*(len-1))/2 );
  *s++ = min;
  *s++ = max;
  *s++ = minLoc;
  *s++ = maxLoc;
}

static void diff_hist( int* cH, int* d_cH )
{
  *d_cH = 0; d_cH++;
  for (int i = 1; i < 256; i++)
    {
      *d_cH = (*cH - *(cH-1));
      d_cH++; cH++;
    }
}

static void smooth_hist( int* cH, int* d_cH )
{
  *d_cH = 0; d_cH++;
  for (int i = 1; i < 255; i++)
    {
      *d_cH = ( *(cH-1) + *cH + *(cH+1) )/3;
      d_cH++; cH++;
    }
  *d_cH = 0;
}

static void cut_hist( int* cH, int exp )
{
  for (int i = 0; i < 256; i++)
    {
      if (*cH < exp) { *cH = 0; }
      *cH++;
    }
}

static int print_bins( int* cH, int exp )
{
  int count_bins = 0;
  for (int i = 0; i < 255; i++)
    {
      if ((*cH == 0 )&&(*(cH+1) > exp)) { printf("Start : %d \n", i); }
      if ((*cH > exp )&&(*(cH+1) == 0)) { printf("End : %d \n", i); count_bins++; }
      *cH++;
    }
  printf("Bins : %d \n", count_bins);
  return count_bins;
}

int main(void)
{
  Mat image (480, 640, CV_8UC3, Scalar(0,0,0));
  int colorHistH[256];
  int colorHistS[256];
  int colorHistV[256];
  int tempHist[256];
  int smoothHist[256];
  int diffHist[256];
  int stats[6]; // Sum, Exp, Max, Min, MinLoc, MaxLoc
  int bins;
  image = imread("../test.png", IMREAD_COLOR); 
  cvtColor(image, image, COLOR_BGR2HSV);
  namedWindow( "Display window", WINDOW_AUTOSIZE );
  imshow( "Display window", image );
  waitKey(0);
  
  do_hist( &image, &colorHistH[0], &colorHistS[0], &colorHistV[0] );
  do_stats( &colorHistH[0], &stats[0], 256 );
  draw_hist ( &colorHistH[0], &stats[0], "Hist" );
  
  smooth_hist ( &colorHistH[0], &smoothHist[0] );
  do_stats( &smoothHist[0], &stats[0], 256 );
  cut_hist( &smoothHist[0], stats[1] );
  draw_hist ( &smoothHist[0], &stats[0], "smoothHist" );
  
  bins = print_bins ( &smoothHist[0], stats[1] );
  
  //diff_hist( &smoothHist[0], &diffHist[0] );
  //do_stats( &diffHist[0], &stats[0], 256 );
  //draw_hist ( &diffHist[0], &stats[0], "diffHist" );
  
  //bins = print_bins ( &diffHist[0], stats[1] );
  //printf(" avg: %d \n exp : %d \n min : %d \n max : %d \n minLoc : %d \n maxLoc : %d \n", stats[0], stats[1], stats[2], stats[3], stats[4], stats[5] );
  
  return 0;
}
