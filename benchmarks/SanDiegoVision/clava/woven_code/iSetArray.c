#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * iSetArray(int rows, int cols, int val) {
   int i, j;
   I2D *out;
   out = iMallocHandle(rows, cols);
   for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {
         out->data[(i) * out->width + (j)] = val;
      }
   }
   
   return out;
}
