#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fReshape(F2D *in, int rows, int cols) {
   F2D *out;
   int i, j, k;
   int r, c;
   r = in->height;
   c = in->width;
   out = fMallocHandle(rows, cols);
   k = 0;
   for(i = 0; i < c; i++) {
      for(j = 0; j < r; j++) {
         out->data[k++] = in->data[(j) * in->width + (i)];
      }
   }
   
   return out;
}
