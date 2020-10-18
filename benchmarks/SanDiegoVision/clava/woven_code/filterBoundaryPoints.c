#include "sift.h"
/**
Filter out points on the boundaries.
The function returns oframes, which
contains the row, col and the interval number
**/
F2D * filterBoundaryPoints(int M, int N, F2D *oframes) {
   int i, k = 0, m = 0;
   int cnt;
   I2D *sel;
   F2D *ret;
   cnt = 0;
   for(i = 0; i < oframes->width; i++) {
      if(oframes->data[i] > 3 && oframes->data[i] < (N - 3) && oframes->data[(1) * oframes->width + (i)] > 3 && oframes->data[(1) * oframes->width + (i)] < (M - 3)) {
         cnt++;
      }
   }
   sel = iSetArray(cnt, 1, 0);
   for(i = 0; i < oframes->width; i++) {
      if(oframes->data[i] > 3 && oframes->data[i] < (N - 3) && oframes->data[(1) * oframes->width + (i)] > 3 && oframes->data[(1) * oframes->width + (i)] < (M - 3)) {
         sel->data[k] = i;
         k++;
      }
      m++;
   }
   if(sel->height > 0) {
      ret = fSetArray(oframes->height, sel->height, 0);
      {
         for(i = 0; i < sel->height; i++) {
            ret->data[(0) * ret->width + (i)] = oframes->data[(0) * oframes->width + (sel->data[i])];
            ret->data[(1) * ret->width + (i)] = oframes->data[(1) * oframes->width + (sel->data[i])];
            ret->data[(2) * ret->width + (i)] = oframes->data[(2) * oframes->width + (sel->data[i])];
         }
      }
   }
   else ret = fSetArray(1, 1, 0);
   iFreeHandle(sel);
   
   return ret;
}
