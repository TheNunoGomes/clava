#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * randnWrapper(int m, int n) {
   F2D *out;
   float seed;
   int i, j;
   out = fSetArray(m, n, 0);
   seed = 0.9;
   for(i = 0; i < m; i++) {
      for(j = 0; j < n; j++) {
         if(i < j) out->data[(i) * out->width + (j)] = seed * ((i + 1.0) / (j + 1.0));
         else out->data[(i) * out->width + (j)] = seed * ((j + 1.0) / (i + 1.0));
      }
   }
   for(i = 0; i < m; i++) {
      for(j = 0; j < n; j++) {
         float w;
         w = out->data[(i) * out->width + (j)];
         w = ((-2.0 * log(w)) / w);
         out->data[(i) * out->width + (j)] = w;
      }
   }
   
   return out;
}
