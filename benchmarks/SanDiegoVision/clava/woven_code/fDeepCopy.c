#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fDeepCopy(F2D *in) {
   int i, j;
   F2D *out;
   int rows, cols;
   rows = in->height;
   cols = in->width;
   out = fMallocHandle(rows, cols);
   for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {
         out->data[(i) * out->width + (j)] = in->data[(i) * in->width + (j)];
      }
   }
   
   return out;
}
