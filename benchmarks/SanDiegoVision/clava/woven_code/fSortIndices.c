#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * fSortIndices(F2D *input, int dim) {
   int rows, cols;
   F2D *in;
   int i, j, k;
   I2D *ind;
   rows = input->height;
   cols = input->width;
   in = fDeepCopy(input);
   ind = iMallocHandle(rows, cols);
   for(i = 0; i < cols; i++) {
      for(j = 0; j < rows; j++) {
         ind->data[(j) * ind->width + (i)] = 0;
      }
   }
   if(dim == 1) {
      for(k = 0; k < rows; k++) {
         for(i = 0; i < cols; i++) {
            float localMax = in->data[(k) * in->width + (i)];
            int localIndex = i;
            ind->data[(k) * ind->width + (i)] = i;
            for(j = 0; j < cols; j++) {
               if(localMax < in->data[(k) * in->width + (j)]) {
                  ind->data[(k) * ind->width + (i)] = j;
                  localMax = in->data[(k) * in->width + (j)];
                  localIndex = j;
               }
            }
            in->data[(k) * in->width + (localIndex)] = 0;
         }
      }
      fFreeHandle(in);
      
      return ind;
   }
   for(k = 0; k < cols; k++) {
      for(i = 0; i < rows; i++) {
         float localMax = in->data[(i) * in->width + (k)];
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
   fFreeHandle(in);
   
   return ind;
}
