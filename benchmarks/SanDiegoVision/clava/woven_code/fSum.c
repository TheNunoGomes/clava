#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * fSum(F2D *inMat) {
   F2D *outMat;
   int rows, cols, i, j, k;
   float temp;
   int newRow, newCols;
   int Rcols;
   rows = inMat->height;
   cols = inMat->width;
   if(cols == 1 || rows == 1) Rcols = 1;
   else Rcols = cols;
   outMat = fSetArray(1, Rcols, 0);
   if(cols == 1) {
      temp = 0;
      for(j = 0; j < rows; j++) temp = temp + inMat->data[(j) * inMat->width + (0)];
      outMat->data[0] = temp;
   }
   else if(rows == 1) {
      temp = 0;
      for(j = 0; j < cols; j++) temp = temp + inMat->data[j];
      outMat->data[0] = temp;
   }
   else {
      for(i = 0; i < cols; i++) {
         temp = 0;
         for(j = 0; j < rows; j++) temp = temp + inMat->data[(j) * inMat->width + (i)];
         outMat->data[i] = temp;
      }
   }
   
   return outMat;
}
