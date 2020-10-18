#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * ffVertcat(F2D *matrix1, F2D *matrix2) {
   F2D *outMatrix;
   int row1, col1, row2, col2, i, j, k;
   row1 = matrix1->height;
   col1 = matrix1->width;
   row2 = matrix2->height;
   col2 = matrix2->width;
   outMatrix = fMallocHandle(row1 + row2, col1);
   for(i = 0; i < col1; i++) {
      for(j = 0; j < row1; j++) {
         outMatrix->data[(j) * outMatrix->width + (i)] = matrix1->data[(j) * matrix1->width + (i)];
      }
      for(k = 0; k < row2; k++) {
         outMatrix->data[((k + row1)) * outMatrix->width + (i)] = matrix2->data[(k) * matrix2->width + (i)];
      }
   }
   
   return outMatrix;
}
