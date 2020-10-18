#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * ffConv2(F2D *a, F2D *b) {
   F2D *c, *out;
   int ma, na, mb, nb, ci, cj, i, j, m, n, ri, mm, nn;
   int r_index, c_index;
   ma = a->height;
   na = a->width;
   mb = b->height;
   nb = b->width;
   ci = ma;
   cj = na;
   c = fSetArray(ci, cj, 0);
   r_index = mb / 2;
   c_index = nb / 2;
   for(i = 0; i < ma; i++) {
      for(j = 0; j < na; j++) {
         for(m = 0; m < mb; m++) {
            mm = mb - 1 - m;
            for(n = 0; n < nb; n++) {
               nn = nb - 1 - n;
               ri = i + m - r_index;
               ci = j + n - c_index;
               if(ri >= 0 && ri < ma && ci >= 0 && ci < na) c->data[(i) * c->width + (j)] += a->data[(ri) * a->width + (ci)] * b->data[(mm) * b->width + (nn)];
            }
         }
      }
   }
   
   return c;
}
