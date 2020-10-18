#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fTimes(F2D *a, F2D *b) {
   F2D *c;
   int i, j, rows, cols;
   rows = a->height;
   cols = a->width;
   c = fMallocHandle(rows, cols);
   for(i = 0; i < (rows * cols); i++) c->data[i] = a->data[i] * b->data[i];
   
   return c;
}
