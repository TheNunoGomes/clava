/********************************
Author: Sravanthi Kota Venkata
********************************/

#include "sift.h"
#include <math.h>
#include <assert.h>

#include <string.h>

#include <time.h>
#include <sys/resource.h>

struct rusage ruse;

#define CPU_TIME (getrusage(RUSAGE_SELF,&ruse), ruse.ru_utime.tv_sec + \
    ruse.ru_stime.tv_sec + 1e-6 * \
    (ruse.ru_utime.tv_usec + ruse.ru_stime.tv_usec))

/**
    This function is similar to imageBlur in common/c folder.
    Here, we can specify the sigma value for the gaussian filter
    function.
**/

  const double win_factor = 1.5f;
  const int nbins = 36 ;
  const float threshold = 0.01f;
  void imsmooth(F2D* array, float dsigma, F2D* out)
  {
    int M,N ;
    int i,j,k;
    float s ;

    double first, second;
    // Save user and CPU start time
    first = CPU_TIME;
    /* ------------------------------------------------------------------
    **                                                Check the arguments
    ** --------------------------------------------------------------- */

      M = array->height;
      N = array->width;
      s = dsigma;

    /* ------------------------------------------------------------------
    **                                                         Do the job
    ** --------------------------------------------------------------- */
    if(s > threshold)
    {
      int W = (int) ceil(4*s) ;
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0f;
      buffer = fSetArray(M,N,0);

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] = (float)(expf(-0.5f * (j - W)*(j - W)/(s*s)));
        acc += temp[j];
      }

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] /= acc;
      }

      /*
      **  Convolve along the columns
          Estrategiras implementadas:
            1 - Loops separados em 3 - Janela deslizante + "moldura" (esquerda + direita)
              1.1 - Isto prepara o loop para melhorias futuras
              1.2 - As equivalencias estao corretas pois W < (N-1)/2 e W < (M-1)/2 para todo o dataset
            2 - Loops normalizados
      */
      for(j = 0; j < M; ++j) {
         for(i = 0; i < W; ++i) {
            int startCol = (((i - W) > (0)) ? (i - W) : (0));
            int endCol = (((i + W) < (N - 1)) ? (i + W) : (N - 1));
            int filterStart = (((0) > (W - i)) ? (0) : (W - i));
            for(k = startCol; k <= endCol; k++) buffer->data[(j) * buffer->width + (i)] += array->data[(j) * array->width + (k)] * temp[filterStart++];
         }
         for(i = W; i < N-W-1; ++i) {
            int startCol = (((i - W) > (0)) ? (i - W) : (0));
            int endCol = (((i + W) < (N - 1)) ? (i + W) : (N - 1));
            int filterStart = (((0) > (W - i)) ? (0) : (W - i));
            for(k = startCol; k <= endCol; k++) buffer->data[(j) * buffer->width + (i)] += array->data[(j) * array->width + (k)] * temp[filterStart++];
         }
         for(i = N-W-1; i < N; ++i) {
            int startCol = (((i - W) > (0)) ? (i - W) : (0));
            int endCol = (((i + W) < (N - 1)) ? (i + W) : (N - 1));
            int filterStart = (((0) > (W - i)) ? (0) : (W - i));
            for(k = startCol; k <= endCol; k++) buffer->data[(j) * buffer->width + (i)] += array->data[(j) * array->width + (k)] * temp[filterStart++];
         }
      }
      /*
      ** Convolve along the rows
      **/
      for(j = 0; j < W; ++j) {
         for(i = 0; i < N; ++i) {
            int startRow = (((j - W) > (0)) ? (j - W) : (0));
            int endRow = (((j + W) < (M - 1)) ? (j + W) : (M - 1));
            int filterStart = (((0) > (W - j)) ? (0) : (W - j));
	    for(k = startRow; k <= endRow; k++) out->data[(j) * out->width + (i)] += buffer->data[(k) * buffer->width + (i)] * temp[filterStart++];
		    	
         }
      }
      for(j = W; j < M-W-1; ++j) {
         for(i = 0; i < N; ++i) {
            int startRow = (((j - W) > (0)) ? (j - W) : (0));
            int endRow = (((j + W) < (M - 1)) ? (j + W) : (M - 1));
            int filterStart = (((0) > (W - j)) ? (0) : (W - j));
	    for(k = startRow; k <= endRow; k++) out->data[(j) * out->width + (i)] += buffer->data[(k) * buffer->width + (i)] * temp[filterStart++];
         }
      }
      for(j = M-W-1; j < M; ++j) {
         for(i = 0; i < N; ++i) {
            int startRow = (((j - W) > (0)) ? (j - W) : (0));
            int endRow = (((j + W) < (M - 1)) ? (j + W) : (M - 1));
            int filterStart = (((0) > (W - j)) ? (0) : (W - j));
	    for(k = startRow; k <= endRow; k++) out->data[(j) * out->width + (i)] += buffer->data[(k) * buffer->width + (i)] * temp[filterStart++];
         }
      }
      //Proof that the loop fission is done correctly
      //Will prompt a message in case there is a value mismatch between the improved code and the baseline.
      #ifdef test
        F2D* buffer1;
        buffer1 = fSetArray(M,N,0);
        F2D* out1;
        out1 = fSetArray(M,N,0);

        int errorcount = 0;

        for(j = 0 ; j < M ; ++j)
        {
          for(i = 0 ; i < N ; ++i)
          {
            int startCol = MAX(i-W,0);
            int endCol = MIN(i+W, N-1);
            int filterStart = MAX(0, W-i);

            for(k=startCol; k<=endCol; k++)
                subsref(buffer1,j,i) += subsref(array, j, k) * temp[filterStart++];
          }
        }

        for(j = 0 ; j < M ; ++j)
        {
          for(i = 0 ; i < N ; ++i)
          {
            int startRow = MAX(j-W,0);
            int endRow = MIN(j+W, M-1);
            int filterStart = MAX(0, W-j);
            for(k=startRow; k<=endRow; k++)
                subsref(out1,j,i) += subsref(buffer1,k,i) * temp[filterStart++];
          }
        }
        for(i = 0; i < M*N; i++){
          if(buffer->data[i] != buffer1->data[i]){
            printf("Buffer Error. i = %d\n", i);
            errorcount++;
          }
          if(out->data[i] != out1->data[i]){
            printf("Out Error. i = %d\n", i);
          }
        }
      #endif

      fFreeHandle(buffer);

    }
    else
    {
        for(i=0;i<M*N;i++)
            asubsref(out, i) = asubsref(array, i);
    }

    // Save end time
    second = CPU_TIME;
    printf("t - \t%.3f\n", (second - first)*1000);
    return;
  }
