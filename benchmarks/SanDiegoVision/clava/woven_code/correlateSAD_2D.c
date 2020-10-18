#include <stdio.h>
#include <stdlib.h>
#include "disparity.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
void correlateSAD_2D(I2D *Ileft, I2D *Iright, I2D *Iright_moved, int win_sz, int disparity, F2D *SAD, F2D *integralImg, F2D *retSAD) {
   int rows, cols;
   int i, j, endRM;
   I2D *range;
   range = iMallocHandle(1, 2);
   range->data[(0) * range->width + (0)] = 0;
   range->data[(0) * range->width + (1)] = disparity;
   rows = Iright_moved->height;
   cols = Iright_moved->width;
   for(i = 0; i < rows * cols; i++) Iright_moved->data[i] = 0;
   padarray4(Iright, range, -1, Iright_moved);
   computeSAD(Ileft, Iright_moved, SAD);
   integralImage2D2D(SAD, integralImg);
   finalSAD(integralImg, win_sz, retSAD);
   iFreeHandle(range);
   
   return;
}
