#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
extern int dFCount;
F2D * ffiConv2(F2D *a, I2D *b) {
   F2D *c;
   F2D *out;
   int ma, na, mb, nb, ci, cj, i, j, m, n;
   int r_index, c_index;
   ma = a->height;
   na = a->width;
   mb = b->height;
   nb = b->width;
   dFCount++;
   dFCount++;
   r_index = ceil((mb + 1.0f) / 2.0f);
   dFCount++;
   dFCount++;
   c_index = ceil((nb + 1.0f) / 2.0f);
   ci = ma + mb - 1;
   cj = na + nb - 1;
   c = fSetArray(ci, cj, 0);
   for(i = 0; i < ci; i++) {
      for(j = 0; j < cj; j++) {
         for(m = 0; m < ma; m++) {
            for(n = 0; n < na; n++) {
               if((i - m) >= 0 && (j - n) >= 0 && (i - m) < mb && (j - n) < nb) c->data[(i) * c->width + (j)] += a->data[(m) * a->width + (n)] * b->data[((i - m)) * b->width + ((j - n))];
            }
         }
      }
   }
   out = fMallocHandle(ma, na);
   for(i = 0; i < ma; i++) {
      for(j = 0; j < na; j++) {
         out->data[(i) * out->width + (j)] = c->data[((i + r_index - 1)) * c->width + ((j + c_index - 1))];
      }
   }
   
   return out;
}
