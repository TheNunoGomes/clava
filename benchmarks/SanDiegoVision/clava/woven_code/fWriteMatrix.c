#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
void fWriteMatrix(F2D *input, char *inpath) {
   FILE *fp;
   char im[100];
   int rows, cols, i, j;
   sprintf(im, "%s/expected_C.txt", inpath);
   fp = fopen(im, "w");
   rows = input->height;
   cols = input->width;
   for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {
         fprintf(fp, "%f\t", input->data[(i) * input->width + (j)]);
      }
      fprintf(fp, "\n");
   }
   fclose(fp);
}
