#include <stdio.h>
#include <stdlib.h>
#include "sift.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * halveSize(F2D *I) {
   F2D *J;
   int i, j, k;
   int hM, hN;
   int M, N;
   M = I->height;
   N = I->width;
   hM = (M + 1) / 2;
   hN = (N + 1) / 2;
   J = fSetArray(hM, hN, 0.0);
   k = 0;
   for(i = 0; i < M; i += 2) {
      for(j = 0; j < N; j += 2) {
         J->data[k++] = I->data[(i) * I->width + (j)];
      }
   }
   
   return J;
}
