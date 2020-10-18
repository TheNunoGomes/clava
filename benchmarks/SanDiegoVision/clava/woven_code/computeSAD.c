#include <stdio.h>
#include <stdlib.h>
#include "disparity.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
void computeSAD(I2D *Ileft, I2D *Iright_moved, F2D *SAD) {
   int rows, cols, i, j, diff;
   rows = Ileft->height;
   cols = Ileft->width;
   for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {
         diff = Ileft->data[(i) * Ileft->width + (j)] - Iright_moved->data[(i) * Iright_moved->width + (j)];
         SAD->data[(i) * SAD->width + (j)] = diff * diff;
      }
   }
   
   return;
}
