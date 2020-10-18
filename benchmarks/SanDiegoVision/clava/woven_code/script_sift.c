#include <stdio.h>
#include <stdlib.h>
#include "sift.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
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
      printf("We need input image path\n");
      
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
   frames = sift(image);
   endTime = photonEndTiming();
   printf("Input size\t\t- (%dx%d)\n", rows, cols);
   elapsed = photonReportTiming(startTime, endTime);
   photonPrintTiming(elapsed);
   free(startTime);
   free(endTime);
   free(elapsed);
   fFreeHandle(frames);
   
   return 0;
}
