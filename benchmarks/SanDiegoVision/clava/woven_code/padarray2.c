#include <stdio.h>
#include <stdlib.h>
#include "disparity.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * padarray2(I2D *inMat, I2D *borderMat) {
   int rows, cols, bRows, bCols, newRows, newCols;
   I2D *paddedArray;
   int i, j;
   rows = inMat->height;
   cols = inMat->width;
   bRows = borderMat->data[0];
   bCols = borderMat->data[1];
   newRows = rows + bRows * 2;
   newCols = cols + bCols * 2;
   paddedArray = iSetArray(newRows, newCols, 0);
   for(i = 0; i < rows; i++) for(j = 0; j < cols; j++) paddedArray->data[((bRows + i)) * paddedArray->width + ((bCols + j))] = inMat->data[(i) * inMat->width + (j)];
   
   return paddedArray;
}
