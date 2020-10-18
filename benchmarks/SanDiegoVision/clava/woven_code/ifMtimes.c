#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * ifMtimes(I2D *a, F2D *b) {
   F2D *out;
   int m, p, p1, n, i, j, k;
   float temp;
   m = a->height;
   p = a->width;
   p1 = b->height;
   n = b->width;
   out = fMallocHandle(m, n);
   for(i = 0; i < m; i++) {
      for(j = 0; j < n; j++) {
         temp = 0;
         for(k = 0; k < p; k++) {
            temp += b->data[(k) * b->width + (j)] * a->data[(i) * a->width + (k)];
         }
         out->data[(i) * out->width + (j)] = temp;
      }
   }
   
   return out;
}
