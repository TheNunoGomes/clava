#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * imageResize(F2D *imageIn) {
   int m, k, rows, cols;
   F2D *imageOut;
   I2D *kernel;
   float tempVal;
   int kernelSize, startCol, endCol, halfKernel, startRow, endRow, i, j, kernelSum;
   int outputRows, outputCols;
   F2D *temp;
   rows = imageIn->height;
   cols = imageIn->width;
   // level 1 is the base image.
   outputRows = floor((rows + 1) / 2);
   outputCols = floor((cols + 1) / 2);
   temp = fSetArray(rows, outputCols, 0);
   imageOut = fSetArray(outputRows, outputCols, 0);
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
      m = 0;
      for(j = startCol; j < endCol; j += 2) {
         tempVal = 0;
         for(k = -halfKernel; k <= halfKernel; k++) {
            tempVal += imageIn->data[(i) * imageIn->width + (j + k)] * kernel->data[k + halfKernel];
         }
         temp->data[(i) * temp->width + (m)] = tempVal / kernelSum;
         m = m + 1;
      }
   }
   m = 0;
   for(i = startRow; i < endRow; i += 2) {
      for(j = 0; j < outputCols; j++) {
         tempVal = 0;
         for(k = -halfKernel; k <= halfKernel; k++) {
            tempVal += temp->data[((i + k)) * temp->width + (j)] * kernel->data[k + halfKernel];
         }
         imageOut->data[(m) * imageOut->width + (j)] = (tempVal / kernelSum);
      }
      m = m + 1;
   }
   fFreeHandle(temp);
   iFreeHandle(kernel);
   
   return imageOut;
}
