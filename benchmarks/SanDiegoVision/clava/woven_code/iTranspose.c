#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * iTranspose(I2D *a) {
   I2D *out;
   int m, p, p1, n, i, j, k;
   int temp;
   m = a->height;
   n = a->width;
   out = iMallocHandle(n, m);
   k = 0;
   for(i = 0; i < n; i++) {
      for(j = 0; j < m; j++) out->data[k++] = a->data[(j) * a->width + (i)];
   }
   
   return out;
}
