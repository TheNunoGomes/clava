#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * iSortIndices(I2D *in, int dim) {
   I2D *sorted;
   int rows, cols, i, j, k, temp;
   I2D *ind;
   rows = in->height;
   cols = in->width;
   sorted = iDeepCopy(in);
   ind = iMallocHandle(rows, cols);
   for(i = 0; i < cols; i++) for(j = 0; j < rows; j++) ind->data[(j) * ind->width + (i)] = 0;
   for(k = 0; k < cols; k++) {
      for(i = 0; i < rows; i++) {
         int localMax = in->data[(i) * in->width + (k)];
         int localIndex = i;
         ind->data[(i) * ind->width + (k)] = i;
         for(j = 0; j < rows; j++) {
            if(localMax < in->data[(j) * in->width + (k)]) {
               ind->data[(i) * ind->width + (k)] = j;
               localMax = in->data[(j) * in->width + (k)];
               localIndex = j;
            }
         }
         in->data[(localIndex) * in->width + (k)] = 0;
      }
   }
   
   return ind;
}
