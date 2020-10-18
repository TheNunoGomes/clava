#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fDivide(F2D *a, float b) {
   F2D *c;
   int i, j, rows, cols;
   rows = a->height;
   cols = a->width;
   c = fMallocHandle(rows, cols);
   for(i = 0; i < (rows * cols); i++) {
      c->data[i] = a->data[i] / b;
   }
   
   return c;
}
