#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include "sift.h"
#include <time.h>
/********************************
Author: Sravanthi Kota Venkata
********************************/
int powCount = 0;
int dFCount = 0;
void normalizeImage(F2D *image) {
   int i;
   int rows;
   int cols;
   int tempMin = 10000, tempMax = -1;
   rows = image->height;
   cols = image->width;
   for(i = 0; i < (rows * cols); i++) if(tempMin > image->data[i]) tempMin = image->data[i];
   for(i = 0; i < (rows * cols); i++) image->data[i] = image->data[i] - tempMin;
   for(i = 0; i < (rows * cols); i++) if(tempMax < image->data[i]) tempMax = image->data[i];
   for(i = 0; i < (rows * cols); i++) image->data[i] = (image->data[i] / (tempMax + 0.0));
}

int main(int argc, char *argv[]) {
   I2D *im;
   F2D *image;
   int rows, cols, i, j;
   F2D *frames;
   unsigned int *startTime, *endTime, *elapsed;
   char imSrc[100];
   if(argc < 2) {
      
      return -1;
   }
   sprintf(imSrc, "%s/1.bmp", argv[1]);
   im = readImage(imSrc);
   image = fiDeepCopy(im);
   iFreeHandle(im);
   rows = image->height;
   cols = image->width;
   startTime = photonStartTiming();
   /** Normalize the input image to lie between 0-1 **/
   normalizeImage(image);
   /** Extract sift features for the normalized image **/
   struct timespec clava_timing_start_0, clava_timing_end_0;
   clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
   frames = sift(image);
   clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
   double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);
   endTime = photonEndTiming();
   elapsed = photonReportTiming(startTime, endTime);
   photonPrintTiming(elapsed);
   free(startTime);
   free(endTime);
   free(elapsed);
   printf("  Pow calls: %d", powCount);
   printf("  Floats that were previously doubles were used these many times: %d", dFCount);
   fFreeHandle(frames);
   
   return 0;
}
