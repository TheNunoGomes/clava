#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * calcSobel_dX(F2D *imageIn) {
   int rows, cols;
   F2D *kernel_1, *kernel_2;
   float temp;
   int kernelSize, startCol, endCol, halfKernel, startRow, endRow, i, j, kernelSum;
   int k, kernelSum_1, kernelSum_2;
   F2D *imageOut, *tempOut;
   rows = imageIn->height;
   cols = imageIn->width;
   imageOut = fSetArray(rows, cols, 0);
   tempOut = fSetArray(rows, cols, 0);
   kernel_1 = fMallocHandle(1, 3);
   kernel_2 = fMallocHandle(1, 3);
   kernel_1->data[0] = 1;
   kernel_1->data[1] = 2;
   kernel_1->data[2] = 1;
   kernelSize = 3;
   kernelSum_1 = 4;
   kernel_2->data[0] = 1;
   kernel_2->data[1] = 0;
   kernel_2->data[2] = -1;
   kernelSum_2 = 2;
   startCol = 1;
   endCol = cols - 1;
   halfKernel = 1;
   startRow = 1;
   endRow = rows - 1;
   for(i = startRow; i < endRow; i++) {
      for(j = startCol; j < endCol; j++) {
         temp = 0;
         for(k = -halfKernel; k <= halfKernel; k++) {
            temp += imageIn->data[(i) * imageIn->width + (j + k)] * kernel_2->data[k + halfKernel];
         }
         tempOut->data[(i) * tempOut->width + (j)] = temp / kernelSum_2;
      }
   }
   for(i = startRow; i < endRow; i++) {
      for(j = startCol; j < endCol; j++) {
         temp = 0;
         for(k = -halfKernel; k <= halfKernel; k++) {
            temp += tempOut->data[((i + k)) * tempOut->width + (j)] * kernel_1->data[k + halfKernel];
         }
         imageOut->data[(i) * imageOut->width + (j)] = temp / (float) kernelSum_1;
      }
   }
   fFreeHandle(tempOut);
   fFreeHandle(kernel_1);
   fFreeHandle(kernel_2);
   
   return imageOut;
}
