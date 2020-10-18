#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
UI2D * uiMallocHandle(int rows, int cols) {
   int i, j;
   UI2D *out;
   out = malloc(sizeof(UI2D) + sizeof(unsigned int) * rows * cols);
   out->height = rows;
   out->width = cols;
   
   return out;
}
