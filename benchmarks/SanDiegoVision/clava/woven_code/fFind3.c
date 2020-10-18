#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fFind3(F2D *in) {
   int r, k, y, x, i, j;
   F2D *points;
   y = in->height;
   x = in->width;
   r = 0;
   for(i = 0; i < y; i++) {
      for(j = 0; j < x; j++) {
         if(in->data[(i) * in->width + (j)] != 0) r++;
      }
   }
   points = fSetArray(r, 3, 0);
   k = 0;
   for(j = 0; j < x; j++) {
      for(i = 0; i < y; i++) {
         if(in->data[(i) * in->width + (j)] != 0) {
            points->data[(k) * points->width + (0)] = j * 1.0;
            points->data[(k) * points->width + (1)] = i * 1.0;
            points->data[(k) * points->width + (2)] = in->data[(i) * in->width + (j)];
            k++;
         }
      }
   }
   
   return points;
}
