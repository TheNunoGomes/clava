#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * iDeepCopyRange(I2D *in, int startRow, int numberRows, int startCol, int numberCols) {
   int i, j, k;
   I2D *out;
   int rows, cols;
   rows = numberRows + startRow;
   cols = numberCols + startCol;
   out = iMallocHandle(numberRows, numberCols);
   k = 0;
   for(i = startRow; i < rows; i++) for(j = startCol; j < cols; j++) out->data[k++] = in->data[(i) * in->width + (j)];
   
   return out;
}
