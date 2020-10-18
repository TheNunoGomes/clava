#include <stdio.h>
#include <stdlib.h>
#include "disparity.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
void integralImage2D2D(F2D *SAD, F2D *integralImg) {
   int nr, nc, i, j;
   nr = SAD->height;
   nc = SAD->width;
   for(i = 0; i < nc; i++) integralImg->data[(0) * integralImg->width + (i)] = SAD->data[(0) * SAD->width + (i)];
   for(i = 1; i < nr; i++) for(j = 0; j < nc; j++) {
      integralImg->data[(i) * integralImg->width + (j)] = integralImg->data[((i - 1)) * integralImg->width + (j)] + SAD->data[(i) * SAD->width + (j)];
   }
   for(i = 0; i < nr; i++) for(j = 1; j < nc; j++) integralImg->data[(i) * integralImg->width + (j)] = integralImg->data[(i) * integralImg->width + ((j - 1))] + integralImg->data[(i) * integralImg->width + (j)];
   
   return;
}
