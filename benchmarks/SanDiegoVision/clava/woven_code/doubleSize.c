#include "sift.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
F2D * doubleSize(F2D *I) {
   F2D *J;
   int M, N, i, j;
   M = I->height;
   N = I->width;
   J = fSetArray(2 * M, 2 * N, 0);
   for(i = 0; i < M; i++) {
      for(j = 0; j < N; j++) {
         J->data[(2 * i) * J->width + (j * 2)] = I->data[(i) * I->width + (j)];
      }
   }
   for(i = 0; i < M - 1; i++) {
      for(j = 0; j < N - 1; j++) {
         J->data[(i * 2 + 1) * J->width + (j * 2 + 1)] = (0.25 * (I->data[(i) * I->width + (j)] + I->data[(i + 1) * I->width + (j)] + I->data[(i) * I->width + (j + 1)] + I->data[((i + 1)) * I->width + (j + 1)]));
      }
   }
   for(i = 0; i < M - 1; i++) {
      for(j = 0; j < N; j++) {
         J->data[(i * 2 + 1) * J->width + (j * 2)] = (0.5 * (I->data[(i) * I->width + (j)] + I->data[(i + 1) * I->width + (j)]));
      }
   }
   for(i = 0; i < M; i++) {
      for(j = 0; j < N - 1; j++) {
         J->data[(i * 2) * J->width + (j * 2 + 1)] = (0.5 * (I->data[(i) * I->width + (j)] + I->data[(i) * I->width + (j + 1)]));
      }
   }
   
   return J;
}
