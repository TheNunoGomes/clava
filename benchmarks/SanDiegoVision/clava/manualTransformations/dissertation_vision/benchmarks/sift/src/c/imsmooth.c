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

#define test
/**
    This function is similar to imageBlur in common/c folder.
    Here, we can specify the sigma value for the gaussian filter
    function.
**/

  const double win_factor = 1.5;
  const int nbins = 36 ;
  const float threshold = 0.01;
   
  void imsmooth(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;

      buffer = fSetArray(M,N,0);

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] = (float)(expf(-0.5 * (j - W)*(j - W)/(s*s))) ;
        acc += temp[j];
      }

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] /= acc ;
      }

      /*
      ** Convolve along the columns
      **/

      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startCol = MAX(i-W,0);
          int endCol = MIN(i+W, N-1);
          int filterStart = MAX(0, W-i);
          for(k=startCol; k<=endCol; k++)
              subsref(buffer,j,i) += subsref(array, j, k) * temp[filterStart++];
        }
      }

      /*
      ** Convolve along the rows
      **/
      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startRow = MAX(j-W,0);
          int endRow = MIN(j+W, M-1);
          int filterStart = MAX(0, W-j);
          for(k=startRow; k<=endRow; k++)
              subsref(out,j,i) += subsref(buffer,k,i) * temp[filterStart++];
        }
      }
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
      	printf("Under the threshold.\n");
        for(i=0;i<M*N;i++)
            asubsref(out, i) = asubsref(array, i);
    }

    // Save end time
    second = CPU_TIME;
    printf("t - \t%.3f\n", (second - first)*1000);
    return;
  }
  void imsmooth5W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      int W = 5;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;
      float b, b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10;
      //float temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10;

      buffer = fSetArray(M,N,0);

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] = (float)(expf(-0.5 * (j - W)*(j - W)/(s*s))) ;
        acc += temp[j];
      }
      for(j = 0 ; j < (2*W+1) ; ++j)
      {
	temp[j] /= acc ;
      }
      /*
      temp0 = temp[0];
      temp1 = temp[1];
      temp2 = temp[2];
      temp3 = temp[3];
      temp4 = temp[4];
      temp5 = temp[5];
      temp6 = temp[6];
      temp7 = temp[7];
      temp8 = temp[8];
      temp9 = temp[9];
      temp10 = temp[10];
	*/
	for(j = 0; j < M; ++j) {
		b0 = array->data[(j) * array->width + (0)];
		b1 = array->data[(j) * array->width + (1)];
		b2 = array->data[(j) * array->width + (2)];
		b3 = array->data[(j) * array->width + (3)];
		b4 = array->data[(j) * array->width + (4)];
		b5 = array->data[(j) * array->width + (5)];
		for(i = 0; i < W; ++i) {
			b = b0 * temp[W-i];
			b += b1 * temp[W+1-i];
			b += b2 * temp[W+2-i];
			b += b3 * temp[W+3-i];
			b += b4 * temp[W+4-i];
			b += b5 * temp[W+5-i];
			for(k = 0; k < i; ++k) {
				b += array->data[(j) * array->width + (k+W+1)] * temp[W-i+k+6];
			}
            		buffer->data[(j) * buffer->width + (i)] += b;
		}
	}
	for(j = 0; j < M; ++j) {
		b0 = array->data[(j) * array->width + (0)];
		b1 = array->data[(j) * array->width + (1)];
		b2 = array->data[(j) * array->width + (2)];
		b3 = array->data[(j) * array->width + (3)];
		b4 = array->data[(j) * array->width + (4)];
		b5 = array->data[(j) * array->width + (5)];
		b6 = array->data[(j) * array->width + (6)];
		b7 = array->data[(j) * array->width + (7)];
		b8 = array->data[(j) * array->width + (8)];
		b9 = array->data[(j) * array->width + (9)];
		
		for(i = 0; i < N-2*W-1; ++i) {
		
			b10 = array->data[(j) * array->width + (i+2*W)];
			
			b = b0 * temp[0];
			b += b1 * temp[1];
			b += b2 * temp[2];
			b += b3 * temp[3];
			b += b4 * temp[4];
			b += b5 * temp[5];
			b += b6 * temp[6];
			b += b7 * temp[7];
			b += b8 * temp[8];
			b += b9 * temp[9];
			b += b10 * temp[10];
			
			b0 = b1;
			b1 = b2;
			b2 = b3;
			b3 = b4;
			b4 = b5;
			b5 = b6;
			b6 = b7;
			b7 = b8;
			b8 = b9;
			b9 = b10;

			buffer->data[(j) * buffer->width + (i+W)] += b;
		}
	}
	for(j = 0; j < M; ++j) {
		for(i = N-W-1; i < N; ++i) {
			b = array->data[(j) * array->width + (0+i-W)] * temp[0];
			b += array->data[(j) * array->width + (1+i-W)] * temp[1];
			b += array->data[(j) * array->width + (2+i-W)] * temp[2];
			b += array->data[(j) * array->width + (3+i-W)] * temp[3];
			b += array->data[(j) * array->width + (4+i-W)] * temp[4];
			for(k = 0; k < N-i; ++k) {
				b += array->data[(j) * array->width + (k+i)] * temp[k+W];
			}
			buffer->data[(j) * buffer->width + (i)] += b;
		}
	}
      
      for(j = 0; j < W; ++j) {
         for(i = 0; i < N; ++i) {
            //asm("#Start of Loop 1 - Rows"::);
            int startRow = (((j - W) > (0)) ? (j - W) : (0));
            int endRow = (((j + W) < (M - 1)) ? (j + W) : (M - 1));
            int filterStart = (((0) > (W - j)) ? (0) : (W - j));
            //asm("#End of Loop 1 - Rows"::);
	    for(k = startRow; k <= endRow; k++) {
            	out->data[(j) * out->width + (i)] += buffer->data[(k) * buffer->width + (i)] * temp[filterStart++];
            }	    	
         }
      }
      for(j = W; j < M-W-1; ++j) {
         for(i = 0; i < N; ++i) {
            //asm("#Start of Loop 2 - Rows"::);
            int startRow = (((j - W) > (0)) ? (j - W) : (0));
            int endRow = (((j + W) < (M - 1)) ? (j + W) : (M - 1));
            int filterStart = (((0) > (W - j)) ? (0) : (W - j));
            //asm("#End of Loop 2 - Rows"::);
	    for(k = startRow; k <= endRow; k++) {
            	out->data[(j) * out->width + (i)] += buffer->data[(k) * buffer->width + (i)] * temp[filterStart++];
            }
         }
      }
      for(j = M-W-1; j < M; ++j) {
         for(i = 0; i < N; ++i) {
            //asm("#Start of Loop 3 - Rows"::);
            int startRow = (((j - W) > (0)) ? (j - W) : (0));
            int endRow = (((j + W) < (M - 1)) ? (j + W) : (M - 1));
            int filterStart = (((0) > (W - j)) ? (0) : (W - j));
            //asm("#End of Loop 3 - Rows"::);
	    for(k = startRow; k <= endRow; k++) {
            	out->data[(j) * out->width + (i)] += buffer->data[(k) * buffer->width + (i)] * temp[filterStart++];
            }
         }
      }
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


    // Save end time
    second = CPU_TIME;
    printf("t - \t%.3f\n", (second - first)*1000);
    return;
  }
  
  void imsmooth7W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      int W = 7;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;

      buffer = fSetArray(M,N,0);

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] = (float)(expf(-0.5 * (j - W)*(j - W)/(s*s))) ;
        acc += temp[j];
      }

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] /= acc ;
      }

      /*
      ** Convolve along the columns
      **/

      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startCol = MAX(i-W,0);
          int endCol = MIN(i+W, N-1);
          int filterStart = MAX(0, W-i);
          for(k=startCol; k<=endCol; k++)
              subsref(buffer,j,i) += subsref(array, j, k) * temp[filterStart++];
        }
      }

      /*
      ** Convolve along the rows
      **/
      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startRow = MAX(j-W,0);
          int endRow = MIN(j+W, M-1);
          int filterStart = MAX(0, W-j);
          for(k=startRow; k<=endRow; k++)
              subsref(out,j,i) += subsref(buffer,k,i) * temp[filterStart++];
        }
      }
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


    // Save end time
    second = CPU_TIME;
    printf("t - \t%.3f\n", (second - first)*1000);
    return;
  }
  
  void imsmooth8W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      int W = 8;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;

      buffer = fSetArray(M,N,0);

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] = (float)(expf(-0.5 * (j - W)*(j - W)/(s*s))) ;
        acc += temp[j];
      }

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] /= acc ;
      }

      /*
      ** Convolve along the columns
      **/

      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startCol = MAX(i-W,0);
          int endCol = MIN(i+W, N-1);
          int filterStart = MAX(0, W-i);
          for(k=startCol; k<=endCol; k++)
              subsref(buffer,j,i) += subsref(array, j, k) * temp[filterStart++];
        }
      }

      /*
      ** Convolve along the rows
      **/
      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startRow = MAX(j-W,0);
          int endRow = MIN(j+W, M-1);
          int filterStart = MAX(0, W-j);
          for(k=startRow; k<=endRow; k++)
              subsref(out,j,i) += subsref(buffer,k,i) * temp[filterStart++];
        }
      }
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


    // Save end time
    second = CPU_TIME;
    printf("t - \t%.3f\n", (second - first)*1000);
    return;
  }
  
  void imsmooth10W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      int W = 10;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;

      buffer = fSetArray(M,N,0);

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] = (float)(expf(-0.5 * (j - W)*(j - W)/(s*s))) ;
        acc += temp[j];
      }

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] /= acc ;
      }

      /*
      ** Convolve along the columns
      **/

      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startCol = MAX(i-W,0);
          int endCol = MIN(i+W, N-1);
          int filterStart = MAX(0, W-i);
          for(k=startCol; k<=endCol; k++)
              subsref(buffer,j,i) += subsref(array, j, k) * temp[filterStart++];
        }
      }

      /*
      ** Convolve along the rows
      **/
      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startRow = MAX(j-W,0);
          int endRow = MIN(j+W, M-1);
          int filterStart = MAX(0, W-j);
          for(k=startRow; k<=endRow; k++)
              subsref(out,j,i) += subsref(buffer,k,i) * temp[filterStart++];
        }
      }
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


    // Save end time
    second = CPU_TIME;
    printf("t - \t%.3f\n", (second - first)*1000);
    return;
  }
  
  void imsmooth13W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      int W = 13;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;

      buffer = fSetArray(M,N,0);

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] = (float)(expf(-0.5 * (j - W)*(j - W)/(s*s))) ;
        acc += temp[j];
      }

      for(j = 0 ; j < (2*W+1) ; ++j)
      {
        temp[j] /= acc ;
      }

      /*
      ** Convolve along the columns
      **/

      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startCol = MAX(i-W,0);
          int endCol = MIN(i+W, N-1);
          int filterStart = MAX(0, W-i);
          for(k=startCol; k<=endCol; k++)
              subsref(buffer,j,i) += subsref(array, j, k) * temp[filterStart++];
        }
      }

      /*
      ** Convolve along the rows
      **/
      for(j = 0 ; j < M ; ++j)
      {
        for(i = 0 ; i < N ; ++i)
        {
          int startRow = MAX(j-W,0);
          int endRow = MIN(j+W, M-1);
          int filterStart = MAX(0, W-j);
          for(k=startRow; k<=endRow; k++)
              subsref(out,j,i) += subsref(buffer,k,i) * temp[filterStart++];
        }
      }
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


    // Save end time
    second = CPU_TIME;
    printf("t - \t%.3f\n", (second - first)*1000);
    return;
  }
  
