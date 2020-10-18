#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * iSort(I2D *in, int dim) {
   I2D *sorted;
   int rows, cols, i, j, k, temp;
   rows = in->height;
   cols = in->width;
   sorted = iDeepCopy(in);
   for(k = 0; k < cols; k++) {
      for(i = 0; i < rows; i++) {
         for(j = i + 1; j < rows; j++) {
            int sik, sjk;
            sik = sorted->data[(i) * sorted->width + (k)];
            sjk = sorted->data[(j) * sorted->width + (k)];
            if(sik < sjk) {
               temp = sjk;
               sjk = sik;
               sik = temp;
            }
         }
      }
   }
   
   return sorted;
}
