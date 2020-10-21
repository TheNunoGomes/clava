#include "sift.h"
#include <math.h>
#include <assert.h>
/********************************
Author: Sravanthi Kota Venkata
********************************/

double const win_factor = 1.5;
int const nbins = 36;
float const threshold = 0.01;
/**
This function is similar to imageBlur in common/c folder.
Here, we can specify the sigma value for the gaussian filter
function.
**/
extern int dFCount;
void imsmooth(F2D *array, float dsigma, F2D *out) {
   int M, N;
   int i, j, k;
   float s;
   /*------------------------------------------------------------------
   **                                                Check the arguments
   ** ---------------------------------------------------------------*/
   M = array->height;
   N = array->width;
   s = dsigma;
   /*------------------------------------------------------------------
   **                                                         Do the job
   ** ---------------------------------------------------------------*/
   if(s > threshold) {
      int W = (int) ceil(4 * s);
      float temp[2 * W + 1];
      F2D *buffer;
      float acc = 0.0;
      buffer = fSetArray(M, N, 0);
      for(j = 0; j < (2 * W + 1); ++j) {
         dFCount++;
         temp[j] = (float) (expf(-0.5f * (j - W) * (j - W) / (s * s)));
         acc += temp[j];
      }
      for(j = 0; j < (2 * W + 1); ++j) {
         temp[j] /= acc;
      }
      /*
      ** Convolve along the columns
      **/
      for(j = 0; j < M; ++j) {
         for(i = 0; i < N; ++i) {
            int startCol = (((i - W) > (0)) ? (i - W) : (0));
            int endCol = (((i + W) < (N - 1)) ? (i + W) : (N - 1));
            int filterStart = (((0) > (W - i)) ? (0) : (W - i));
            for(k = startCol; k <= endCol; k++) buffer->data[(j) * buffer->width + (i)] += array->data[(j) * array->width + (k)] * temp[filterStart++];
         }
      }
      /*
      ** Convolve along the rows
      **/
      for(j = 0; j < M; ++j) {
         for(i = 0; i < N; ++i) {
            int startRow = (((j - W) > (0)) ? (j - W) : (0));
            int endRow = (((j + W) < (M - 1)) ? (j + W) : (M - 1));
            int filterStart = (((0) > (W - j)) ? (0) : (W - j));
            for(k = startRow; k <= endRow; k++) out->data[(j) * out->width + (i)] += buffer->data[(k) * buffer->width + (i)] * temp[filterStart++];
         }
      }
      fFreeHandle(buffer);
   }
   else {
      for(i = 0; i < M * N; i++) out->data[i] = array->data[i];
   }
   
   return;
}
