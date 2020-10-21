#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * readFile(unsigned char *fileName) {
   FILE *fp;
   F2D *fill;
   float temp;
   int rows, cols;
   int i, j;
   fp = fopen(fileName, "r");
   if(fp == ((void *) 0)) {
      
      return ((void *) 0);
   }
   fscanf(fp, "%d", &cols);
   fscanf(fp, "%d", &rows);
   fill = fSetArray(rows, cols, 0);
   for(i = 0; i < rows; i++) {
      for(j = 0; j < cols; j++) {
         fscanf(fp, "%f", &(fill->data[(i) * fill->width + (j)]));
      }
   }
   fclose(fp);
   
   return fill;
}
