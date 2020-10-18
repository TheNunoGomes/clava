#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * imageBlur(I2D *imageIn) {
   int rows, cols;
   F2D *imageOut, *tempOut;
   float temp;
   I2D *kernel;
   int k, kernelSize, startCol, endCol, halfKernel, startRow, endRow, i, j, kernelSum;
   rows = imageIn->height;
   cols = imageIn->width;
   imageOut = fSetArray(rows, cols, 0);
   tempOut = fSetArray(rows, cols, 0);
   kernel = iMallocHandle(1, 5);
   kernel->data[0] = 1;
   kernel->data[1] = 4;
   kernel->data[2] = 6;
   kernel->data[3] = 4;
   kernel->data[4] = 1;
   kernelSize = 5;
   kernelSum = 16;
   startCol = 2;
   endCol = cols - 2;
   halfKernel = 2;
   startRow = 2;
   endRow = rows - 2;
   for(i = startRow; i < endRow; i++) {
      for(j = startCol; j < endCol; j++) {
         temp = 0;
         for(k = -halfKernel; k <= halfKernel; k++) {
            temp += imageIn->data[(i) * imageIn->width + (j + k)] * kernel->data[k + halfKernel];
         }
         tempOut->data[(i) * tempOut->width + (j)] = temp / kernelSum;
      }
   }
   for(i = startRow; i < endRow; i++) {
      for(j = startCol; j < endCol; j++) {
         temp = 0;
         for(k = -halfKernel; k <= halfKernel; k++) {
            temp += tempOut->data[((i + k)) * tempOut->width + (j)] * kernel->data[k + halfKernel];
         }
         imageOut->data[(i) * imageOut->width + (j)] = temp / kernelSum;
      }
   }
   fFreeHandle(tempOut);
   iFreeHandle(kernel);
   
   return imageOut;
}
