#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * iDeepCopy(I2D *in) {
   int i, j;
   I2D *out;
   int rows, cols;
   rows = in->height;
   cols = in->width;
   out = iMallocHandle(rows, cols);
   for(i = 0; i < rows; i++) for(j = 0; j < cols; j++) out->data[(i) * out->width + (j)] = in->data[(i) * in->width + (j)];
   
   return out;
}
