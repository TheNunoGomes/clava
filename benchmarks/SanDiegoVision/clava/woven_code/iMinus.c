#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * iMinus(I2D *a, I2D *b) {
   I2D *c;
   int i, j, rows, cols;
   rows = a->height;
   cols = a->width;
   c = iMallocHandle(rows, cols);
   for(i = 0; i < (rows * cols); i++) c->data[i] = a->data[i] - b->data[i];
   
   return c;
}
