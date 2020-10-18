#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * horzcat(F2D *a, F2D *b, F2D *c) {
   F2D *out;
   int rows = 0, cols = 0, i, j, k, c_1, c_2, r_3, c_3;
   c_1 = a->width;
   cols += c_1;
   c_2 = b->width;
   cols += c_2;
   r_3 = c->height;
   c_3 = c->width;
   cols += c_3;
   rows = r_3;
   out = fMallocHandle(rows, cols);
   for(i = 0; i < rows; i++) {
      k = 0;
      for(j = 0; j < c_1; j++) {
         out->data[(i) * out->width + (k)] = a->data[(i) * a->width + (j)];
         k++;
      }
      for(j = 0; j < c_2; j++) {
         out->data[(i) * out->width + (k)] = b->data[(i) * b->width + (j)];
         k++;
      }
      for(j = 0; j < c_3; j++) {
         out->data[(i) * out->width + (k)] = c->data[(i) * c->width + (j)];
         k++;
      }
   }
   
   return out;
}
