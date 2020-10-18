#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fTranspose(F2D *a) {
   F2D *out;
   int m, p, p1, n, i, j, k;
   float temp;
   m = a->height;
   n = a->width;
   out = fMallocHandle(n, m);
   k = 0;
   for(i = 0; i < n; i++) {
      for(j = 0; j < m; j++) out->data[k++] = a->data[(j) * a->width + (i)];
   }
   
   return out;
}
