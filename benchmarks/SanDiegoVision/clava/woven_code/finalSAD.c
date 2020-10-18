#include <stdio.h>
#include <stdlib.h>
#include "disparity.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
void finalSAD(F2D *integralImg, int win_sz, F2D *retSAD) {
   int endR, endC;
   int i, j, k;
   endR = integralImg->height;
   endC = integralImg->width;
   k = 0;
   for(j = 0; j < (endC - win_sz); j++) {
      for(i = 0; i < (endR - win_sz); i++) {
         retSAD->data[(i) * retSAD->width + (j)] = integralImg->data[((win_sz + i)) * integralImg->width + ((j + win_sz))] + integralImg->data[((i + 1)) * integralImg->width + ((j + 1))] - integralImg->data[((i + 1)) * integralImg->width + ((j + win_sz))] - integralImg->data[((win_sz + i)) * integralImg->width + ((j + 1))];
      }
   }
   
   return;
}
