#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fSetArray(int rows, int cols, float val) {
   int i, j;
   F2D *out;
   out = fMallocHandle(rows, cols);
   for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {
         out->data[(i) * out->width + (j)] = val;
      }
   }
   
   return out;
}
