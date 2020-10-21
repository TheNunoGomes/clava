#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fMdivide(F2D *a, F2D *b) {
   F2D *c;
   int i, j, rows, cols;
   rows = a->height;
   cols = a->width;
   if(rows != b->height || cols != b->width) {
      
      return ((void *) 0);
   }
   c = fMallocHandle(rows, cols);
   for(i = 0; i < (rows * cols); i++) c->data[i] = a->data[i] / b->data[i];
   
   return c;
}
