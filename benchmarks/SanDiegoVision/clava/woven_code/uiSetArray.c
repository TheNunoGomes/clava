#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
UI2D * uiSetArray(int rows, int cols, int val) {
   int i, j;
   UI2D *out;
   out = uiMallocHandle(rows, cols);
   for(i = 0; i < rows; i++) for(j = 0; j < cols; j++) out->data[(i) * out->width + (j)] = val;
   
   return out;
}
