/********************************
Author: Sravanthi Kota Venkata
********************************/

#define _POSIX_C_SOURCE 199309L
#include "sift.h"
#include <math.h>
#include <assert.h>

#include <string.h>

#include <time.h>
#include <sys/resource.h>

//#define test
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

	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
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

	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);
    return;
  }
  void imsmooth5W(F2D* array, float dsigma, F2D* out, int size)
  {
    int M,N;
    int i,j,k;
    float s;

	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
    /* ------------------------------------------------------------------
    **                                                Check the arguments
    ** --------------------------------------------------------------- */
      M = size;
      N = size;
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
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		for(i = 0; i < W; ++i) {
			b = b0 * temp[W-i];
			b += b1 * temp[W+1-i];
			b += b2 * temp[W+2-i];
			b += b3 * temp[W+3-i];
			b += b4 * temp[W+4-i];
			b += b5 * temp[W+5-i];
			for(k = 0; k < i; ++k) {
				b += array->data[(j) * size + (k+W+1)] * temp[2*W-i+k+1];
			}
            		buffer->data[(j) * size + (i)] += b;
		}
	}
	for(j = 0; j < M; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		b9 = array->data[(j) * size + (9)];
		
		for(i = 0; i < N-2*W-1; ++i) {
		
			b10 = array->data[(j) * size + (i+2*W)];
			
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

			buffer->data[(j) * size + (i+W)] += b;
		}
	}
	for(j = 0; j < M; ++j) {
		for(i = N-W-1; i < N; ++i) {
			b = array->data[(j) * size + (0+i-W)] * temp[0];
			b += array->data[(j) * size + (1+i-W)] * temp[1];
			b += array->data[(j) * size + (2+i-W)] * temp[2];
			b += array->data[(j) * size + (3+i-W)] * temp[3];
			b += array->data[(j) * size + (4+i-W)] * temp[4];
			for(k = 0; k < N-i; ++k) {
				b += array->data[(j) * size + (k+i)] * temp[k+W];
			}
			buffer->data[(j) * size + (i)] += b;
		}
	}
      
      	float t0, t1, t2, t3, t4, t5;
      	float o;
      	
	for(j = 0; j < W; ++j) {
		t0 = temp[W-j+0];
		t1 = temp[W-j+1];
		t2 = temp[W-j+2];
		t3 = temp[W-j+3];
		t4 = temp[W-j+4];
		t5 = temp[W-j+5];
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0) * size + (i)] * t0;
			o += buffer->data[(1) * size + (i)] * t1;
			o += buffer->data[(2) * size + (i)] * t2;
			o += buffer->data[(3) * size + (i)] * t3;
			o += buffer->data[(4) * size + (i)] * t4;
			o += buffer->data[(5) * size + (i)] * t5;
			for(k = 0; k < j; ++k) {
				o += buffer->data[(k+W+1) * size + (i)] * temp[2*W-j+k+1];
			}
			out->data[(j) * size + (i)] += o;
		}
	}
	for(j = 0; j < M-2*W-1; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j) * size + (i)] * temp[0];
			o += buffer->data[(1+j) * size + (i)] * temp[1];
			o += buffer->data[(2+j) * size + (i)] * temp[2];
			o += buffer->data[(3+j) * size + (i)] * temp[3];
			o += buffer->data[(4+j) * size + (i)] * temp[4];
			o += buffer->data[(5+j) * size + (i)] * temp[5];
			o += buffer->data[(6+j) * size + (i)] * temp[6];
			o += buffer->data[(7+j) * size + (i)] * temp[7];
			o += buffer->data[(8+j) * size + (i)] * temp[8];
			o += buffer->data[(9+j) * size + (i)] * temp[9];
			o += buffer->data[(10+j) * size + (i)] * temp[10];
			out->data[(j+W) * size + (i)] += o;
		}
	}
	for(j = M-W-1; j < M; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j-W) * size + (i)] * temp[0];
			o += buffer->data[(1+j-W) * size + (i)] * temp[1];
			o += buffer->data[(2+j-W) * size + (i)] * temp[2];
			o += buffer->data[(3+j-W) * size + (i)] * temp[3];
			o += buffer->data[(4+j-W) * size + (i)] * temp[4];
			for(k = 0; k < M-j; ++k) {
				o += buffer->data[(k+j) * size + (i)] * temp[k+W];
			}
			out->data[(j) * size + (i)] += o;
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


	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);
    return;
  }
  
  void imsmooth7W(F2D* array, float dsigma, F2D* out, int size)
  {
    int M,N;
    int i,j,k;
    float s;

	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
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
      float b, b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14;

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

      for(j = 0; j < M; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		for(i = 0; i < W; ++i) {
			b = b0 * temp[W-i];
			b += b1 * temp[W+1-i];
			b += b2 * temp[W+2-i];
			b += b3 * temp[W+3-i];
			b += b4 * temp[W+4-i];
			b += b5 * temp[W+5-i];
			b += b6 * temp[W+6-i];
			b += b7 * temp[W+7-i];
			for(k = 0; k < i; ++k) {
				b += array->data[(j) * size + (k+W+1)] * temp[2*W-i+k+1];
			}
            		buffer->data[(j) * size + (i)] += b;
		}
	}
	for(j = 0; j < M; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		b9 = array->data[(j) * size + (9)];
		b10 = array->data[(j) * size + (10)];
		b11 = array->data[(j) * size + (11)];
		b12 = array->data[(j) * size + (12)];
		b13 = array->data[(j) * size + (13)];
		
		for(i = 0; i < N-2*W-1; ++i) {
		
			b14 = array->data[(j) * size + (i+2*W)];
			
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
			b += b11 * temp[11];
			b += b12 * temp[12];
			b += b13 * temp[13];
			b += b14 * temp[14];
			
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
			b10 = b11;
			b11 = b12;
			b12 = b13;
			b13 = b14;

			buffer->data[(j) * size + (i+W)] += b;
		}
	}
	for(j = 0; j < M; ++j) {
		for(i = N-W-1; i < N; ++i) {
			b = array->data[(j) * size + (0+i-W)] * temp[0];
			b += array->data[(j) * size + (1+i-W)] * temp[1];
			b += array->data[(j) * size + (2+i-W)] * temp[2];
			b += array->data[(j) * size + (3+i-W)] * temp[3];
			b += array->data[(j) * size + (4+i-W)] * temp[4];
			b += array->data[(j) * size + (5+i-W)] * temp[5];
			b += array->data[(j) * size + (6+i-W)] * temp[6];
			for(k = 0; k < N-i; ++k) {
				b += array->data[(j) * size + (k+i)] * temp[k+W];
			}
			buffer->data[(j) * size + (i)] += b;
		}
	}
      
      	float t0, t1, t2, t3, t4, t5, t6, t7;
      	float o;
      	
	for(j = 0; j < W; ++j) {
		t0 = temp[W-j+0];
		t1 = temp[W-j+1];
		t2 = temp[W-j+2];
		t3 = temp[W-j+3];
		t4 = temp[W-j+4];
		t5 = temp[W-j+5];
		t6 = temp[W-j+6];
		t7 = temp[W-j+7];
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0) * size + (i)] * t0;
			o += buffer->data[(1) * size + (i)] * t1;
			o += buffer->data[(2) * size + (i)] * t2;
			o += buffer->data[(3) * size + (i)] * t3;
			o += buffer->data[(4) * size + (i)] * t4;
			o += buffer->data[(5) * size + (i)] * t5;
			o += buffer->data[(6) * size + (i)] * t6;
			o += buffer->data[(7) * size + (i)] * t7;
			for(k = 0; k < j; ++k) {
				o += buffer->data[(k+W+1) * size + (i)] * temp[2*W-j+k+1];
			}   
			out->data[(j) * size + (i)] += o;	
		}
	}
	for(j = 0; j < M-2*W-1; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j) * size + (i)] * temp[0];
			o += buffer->data[(1+j) * size + (i)] * temp[1];
			o += buffer->data[(2+j) * size + (i)] * temp[2];
			o += buffer->data[(3+j) * size + (i)] * temp[3];
			o += buffer->data[(4+j) * size + (i)] * temp[4];
			o += buffer->data[(5+j) * size + (i)] * temp[5];
			o += buffer->data[(6+j) * size + (i)] * temp[6];
			o += buffer->data[(7+j) * size + (i)] * temp[7];
			o += buffer->data[(8+j) * size + (i)] * temp[8];
			o += buffer->data[(9+j) * size + (i)] * temp[9];
			o += buffer->data[(10+j) * size + (i)] * temp[10];
			o += buffer->data[(11+j) * size + (i)] * temp[11];
			o += buffer->data[(12+j) * size + (i)] * temp[12];
			o += buffer->data[(13+j) * size + (i)] * temp[13];
			o += buffer->data[(14+j) * size + (i)] * temp[14];
			out->data[(j+W) * size + (i)] += o;
		}
	}
	for(j = M-W-1; j < M; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j-W) * size + (i)] * temp[0];
			o += buffer->data[(1+j-W) * size + (i)] * temp[1];
			o += buffer->data[(2+j-W) * size + (i)] * temp[2];
			o += buffer->data[(3+j-W) * size + (i)] * temp[3];
			o += buffer->data[(4+j-W) * size + (i)] * temp[4];
			o += buffer->data[(5+j-W) * size + (i)] * temp[5];
			o += buffer->data[(6+j-W) * size + (i)] * temp[6];
			for(k = 0; k < M-j; k++) {
				o += buffer->data[(k+j) * size + (i)] * temp[k+W];
			}
			out->data[(j) * size + (i)] += o;
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


	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);
    return;
  }
  
  void imsmooth8W(F2D* array, float dsigma, F2D* out, int size)
  {
    int M,N;
    int i,j,k;
    float s;

	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
    /* ------------------------------------------------------------------
    **                                                Check the arguments
    ** --------------------------------------------------------------- */
      M = size;
      N = size;
      s = dsigma;
    /* ------------------------------------------------------------------
    **                                                         Do the job
    ** --------------------------------------------------------------- */

      int W = 8;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;
      float b, b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16;

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

	for(j = 0 ; j < M; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		for(i = 0 ; i < W; ++i) {
			b = b0 * temp[W-i];
			b += b1 * temp[W+1-i];
			b += b2 * temp[W+2-i];
			b += b3 * temp[W+3-i];
			b += b4 * temp[W+4-i];
			b += b5 * temp[W+5-i];
			b += b6 * temp[W+6-i];
			b += b7 * temp[W+7-i];
			b += b8 * temp[W+8-i];
	  		for(k=0; k<i; ++k) {
				b += array->data[(j) * size + (k+W+1)] * temp[2*W-i+k+1];
			}
            		buffer->data[(j) * size + (i)] += b;
	      	}
      	}
	for(j = 0 ; j < M ; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		b9 = array->data[(j) * size + (9)];
		b10 = array->data[(j) * size + (10)];
		b11 = array->data[(j) * size + (11)];
		b12 = array->data[(j) * size + (12)];
		b13 = array->data[(j) * size + (13)];
		b14 = array->data[(j) * size + (14)];
		b15 = array->data[(j) * size + (15)];
		for(i = 0 ; i < N-2*W-1; ++i) {
			b16 = array->data[(j) * size + (i+2*W)];
			
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
			b += b11 * temp[11];
			b += b12 * temp[12];
			b += b13 * temp[13];
			b += b14 * temp[14];
			b += b15 * temp[15];
			b += b16 * temp[16];
			
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
			b10 = b11;
			b11 = b12;
			b12 = b13;
			b13 = b14;
			b14 = b15;
			b15 = b16;

			buffer->data[(j) * size + (i+W)] += b;
		}
	}
	for(j = 0 ; j < M ; ++j) {
		for(i = N-W-1 ; i < N ; ++i) {
			b = array->data[(j) * size + (0+i-W)] * temp[0];
			b += array->data[(j) * size + (1+i-W)] * temp[1];
			b += array->data[(j) * size + (2+i-W)] * temp[2];
			b += array->data[(j) * size + (3+i-W)] * temp[3];
			b += array->data[(j) * size + (4+i-W)] * temp[4];
			b += array->data[(j) * size + (5+i-W)] * temp[5];
			b += array->data[(j) * size + (6+i-W)] * temp[6];
			b += array->data[(j) * size + (7+i-W)] * temp[7];
			for(k=0; k<N-i; ++k) {
				b += array->data[(j) * size + (k+i)] * temp[k+W];
			}
			buffer->data[(j) * size + (i)] += b;
		}
	}
	
	float t0, t1, t2, t3, t4, t5, t6, t7, t8;
      	float o;
      	
	for(j = 0; j < W; ++j) {
		t0 = temp[W-j+0];
		t1 = temp[W-j+1];
		t2 = temp[W-j+2];
		t3 = temp[W-j+3];
		t4 = temp[W-j+4];
		t5 = temp[W-j+5];
		t6 = temp[W-j+6];
		t7 = temp[W-j+7];
		t8 = temp[W-j+8];
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0) * size + (i)] * t0;
			o += buffer->data[(1) * size + (i)] * t1;
			o += buffer->data[(2) * size + (i)] * t2;
			o += buffer->data[(3) * size + (i)] * t3;
			o += buffer->data[(4) * size + (i)] * t4;
			o += buffer->data[(5) * size + (i)] * t5;
			o += buffer->data[(6) * size + (i)] * t6;
			o += buffer->data[(7) * size + (i)] * t7;
			o += buffer->data[(8) * size + (i)] * t8;
			for(k = 0; k < j; ++k) {
				o += buffer->data[(k+W+1) * size + (i)] * temp[2*W-j+k+1];
			}   
			out->data[(j) * size + (i)] += o;	
		}
	}
	for(j = 0; j < M-2*W-1; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j) * size + (i)] * temp[0];
			o += buffer->data[(1+j) * size + (i)] * temp[1];
			o += buffer->data[(2+j) * size + (i)] * temp[2];
			o += buffer->data[(3+j) * size + (i)] * temp[3];
			o += buffer->data[(4+j) * size + (i)] * temp[4];
			o += buffer->data[(5+j) * size + (i)] * temp[5];
			o += buffer->data[(6+j) * size + (i)] * temp[6];
			o += buffer->data[(7+j) * size + (i)] * temp[7];
			o += buffer->data[(8+j) * size + (i)] * temp[8];
			o += buffer->data[(9+j) * size + (i)] * temp[9];
			o += buffer->data[(10+j) * size + (i)] * temp[10];
			o += buffer->data[(11+j) * size + (i)] * temp[11];
			o += buffer->data[(12+j) * size + (i)] * temp[12];
			o += buffer->data[(13+j) * size + (i)] * temp[13];
			o += buffer->data[(14+j) * size + (i)] * temp[14];
			o += buffer->data[(15+j) * size + (i)] * temp[15];
			o += buffer->data[(16+j) * size + (i)] * temp[16];
			out->data[(j+W) * size + (i)] += o;
		}
	}
	for(j = M-W-1; j < M; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j-W) * size + (i)] * temp[0];
			o += buffer->data[(1+j-W) * size + (i)] * temp[1];
			o += buffer->data[(2+j-W) * size + (i)] * temp[2];
			o += buffer->data[(3+j-W) * size + (i)] * temp[3];
			o += buffer->data[(4+j-W) * size + (i)] * temp[4];
			o += buffer->data[(5+j-W) * size + (i)] * temp[5];
			o += buffer->data[(6+j-W) * size + (i)] * temp[6];
			o += buffer->data[(7+j-W) * size + (i)] * temp[7];
			for(k = 0; k < M-j; k++) {
				o += buffer->data[(k+j) * size + (i)] * temp[k+W];
			}
			out->data[(j) * size + (i)] += o;
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


	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);
    return;
  }
  
  void imsmooth10W(F2D* array, float dsigma, F2D* out, int size)
  {
    int M,N;
    int i,j,k;
    float s;

	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
    /* ------------------------------------------------------------------
    **                                                Check the arguments
    ** --------------------------------------------------------------- */
      M = size;
      N = size;
      s = dsigma;
    /* ------------------------------------------------------------------
    **                                                         Do the job
    ** --------------------------------------------------------------- */

      int W = 10;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;
      float b, b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20;

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

	for(j = 0 ; j < M; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		b9 = array->data[(j) * size + (9)];
		b10 = array->data[(j) * size + (10)];
		for(i = 0 ; i < W; ++i) {
			b = b0 * temp[W-i];
			b += b1 * temp[W+1-i];
			b += b2 * temp[W+2-i];
			b += b3 * temp[W+3-i];
			b += b4 * temp[W+4-i];
			b += b5 * temp[W+5-i];
			b += b6 * temp[W+6-i];
			b += b7 * temp[W+7-i];
			b += b8 * temp[W+8-i];
			b += b9 * temp[W+9-i];
			b += b10 * temp[W+10-i];
	  		for(k=0; k<i; ++k) {
				b += array->data[(j) * size + (k+W+1)] * temp[2*W-i+k+1];
			}
            		buffer->data[(j) * size + (i)] += b;
	      	}
      	}
	for(j = 0 ; j < M ; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		b9 = array->data[(j) * size + (9)];
		b10 = array->data[(j) * size + (10)];
		b11 = array->data[(j) * size + (11)];
		b12 = array->data[(j) * size + (12)];
		b13 = array->data[(j) * size + (13)];
		b14 = array->data[(j) * size + (14)];
		b15 = array->data[(j) * size + (15)];
		b16 = array->data[(j) * size + (16)];
		b17 = array->data[(j) * size + (17)];
		b18 = array->data[(j) * size + (18)];
		b19 = array->data[(j) * size + (19)];
		for(i = 0 ; i < N-2*W-1; ++i) {
			b20 = array->data[(j) * size + (i+2*W)];
			
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
			b += b11 * temp[11];
			b += b12 * temp[12];
			b += b13 * temp[13];
			b += b14 * temp[14];
			b += b15 * temp[15];
			b += b16 * temp[16];
			b += b17 * temp[17];
			b += b18 * temp[18];
			b += b19 * temp[19];
			b += b20 * temp[20];
			
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
			b10 = b11;
			b11 = b12;
			b12 = b13;
			b13 = b14;
			b14 = b15;
			b15 = b16;
			b16 = b17;
			b17 = b18;
			b18 = b19;
			b19 = b20;

			buffer->data[(j) * size + (i+W)] += b;
		}
	}
	for(j = 0 ; j < M ; ++j) {
		for(i = N-W-1 ; i < N ; ++i) {
			b = array->data[(j) * size + (0+i-W)] * temp[0];
			b += array->data[(j) * size + (1+i-W)] * temp[1];
			b += array->data[(j) * size + (2+i-W)] * temp[2];
			b += array->data[(j) * size + (3+i-W)] * temp[3];
			b += array->data[(j) * size + (4+i-W)] * temp[4];
			b += array->data[(j) * size + (5+i-W)] * temp[5];
			b += array->data[(j) * size + (6+i-W)] * temp[6];
			b += array->data[(j) * size + (7+i-W)] * temp[7];
			b += array->data[(j) * size + (8+i-W)] * temp[8];
			b += array->data[(j) * size + (9+i-W)] * temp[9];
			for(k=0; k<N-i; ++k) {
				b += array->data[(j) * size + (k+i)] * temp[k+W];
			}
			buffer->data[(j) * size + (i)] += b;
		}
	}
	
	float t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
      	float o;
      	
	for(j = 0; j < W; ++j) {
		t0 = temp[W-j+0];
		t1 = temp[W-j+1];
		t2 = temp[W-j+2];
		t3 = temp[W-j+3];
		t4 = temp[W-j+4];
		t5 = temp[W-j+5];
		t6 = temp[W-j+6];
		t7 = temp[W-j+7];
		t8 = temp[W-j+8];
		t9 = temp[W-j+9];
		t10 = temp[W-j+10];
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0) * size + (i)] * t0;
			o += buffer->data[(1) * size + (i)] * t1;
			o += buffer->data[(2) * size + (i)] * t2;
			o += buffer->data[(3) * size + (i)] * t3;
			o += buffer->data[(4) * size + (i)] * t4;
			o += buffer->data[(5) * size + (i)] * t5;
			o += buffer->data[(6) * size + (i)] * t6;
			o += buffer->data[(7) * size + (i)] * t7;
			o += buffer->data[(8) * size + (i)] * t8;
			o += buffer->data[(9) * size + (i)] * t9;
			o += buffer->data[(10) * size + (i)] * t10;
			for(k = 0; k < j; ++k) {
				o += buffer->data[(k+W+1) * size + (i)] * temp[2*W-j+k+1];
			}   
			out->data[(j) * size + (i)] += o;	
		}
	}
	for(j = 0; j < M-2*W-1; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j) * size + (i)] * temp[0];
			o += buffer->data[(1+j) * size + (i)] * temp[1];
			o += buffer->data[(2+j) * size + (i)] * temp[2];
			o += buffer->data[(3+j) * size + (i)] * temp[3];
			o += buffer->data[(4+j) * size + (i)] * temp[4];
			o += buffer->data[(5+j) * size + (i)] * temp[5];
			o += buffer->data[(6+j) * size + (i)] * temp[6];
			o += buffer->data[(7+j) * size + (i)] * temp[7];
			o += buffer->data[(8+j) * size + (i)] * temp[8];
			o += buffer->data[(9+j) * size + (i)] * temp[9];
			o += buffer->data[(10+j) * size + (i)] * temp[10];
			o += buffer->data[(11+j) * size + (i)] * temp[11];
			o += buffer->data[(12+j) * size + (i)] * temp[12];
			o += buffer->data[(13+j) * size + (i)] * temp[13];
			o += buffer->data[(14+j) * size + (i)] * temp[14];
			o += buffer->data[(15+j) * size + (i)] * temp[15];
			o += buffer->data[(16+j) * size + (i)] * temp[16];
			o += buffer->data[(17+j) * size + (i)] * temp[17];
			o += buffer->data[(18+j) * size + (i)] * temp[18];
			o += buffer->data[(19+j) * size + (i)] * temp[19];
			o += buffer->data[(20+j) * size + (i)] * temp[20];
			out->data[(j+W) * size + (i)] += o;
		}
	}
	for(j = M-W-1; j < M; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j-W) * size + (i)] * temp[0];
			o += buffer->data[(1+j-W) * size + (i)] * temp[1];
			o += buffer->data[(2+j-W) * size + (i)] * temp[2];
			o += buffer->data[(3+j-W) * size + (i)] * temp[3];
			o += buffer->data[(4+j-W) * size + (i)] * temp[4];
			o += buffer->data[(5+j-W) * size + (i)] * temp[5];
			o += buffer->data[(6+j-W) * size + (i)] * temp[6];
			o += buffer->data[(7+j-W) * size + (i)] * temp[7];
			o += buffer->data[(8+j-W) * size + (i)] * temp[8];
			o += buffer->data[(9+j-W) * size + (i)] * temp[9];
			for(k = 0; k < M-j; k++) {
				o += buffer->data[(k+j) * size + (i)] * temp[k+W];
			}
			out->data[(j) * size + (i)] += o;
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


	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);
    return;
  }
  
  void imsmooth13W(F2D* array, float dsigma, F2D* out, int size)
  {
    int M,N;
    int i,j,k;
    float s;

	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
    /* ------------------------------------------------------------------
    **                                                Check the arguments
    ** --------------------------------------------------------------- */
      M = size;
      N = size;
      s = dsigma;
    /* ------------------------------------------------------------------
    **                                                         Do the job
    ** --------------------------------------------------------------- */

      int W = 13;
      //printf("W = %d\n", W);
      float temp[2*W+1];
      F2D* buffer;
      float acc = 0.0;
      float b, b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23, b24, b25, b26;

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

      	for(j = 0 ; j < M; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		b9 = array->data[(j) * size + (9)];
		b10 = array->data[(j) * size + (10)];
		b11 = array->data[(j) * size + (11)];
		b12 = array->data[(j) * size + (12)];
		b13 = array->data[(j) * size + (13)];
		for(i = 0 ; i < W; ++i) {
			b = b0 * temp[W-i];
			b += b1 * temp[W+1-i];
			b += b2 * temp[W+2-i];
			b += b3 * temp[W+3-i];
			b += b4 * temp[W+4-i];
			b += b5 * temp[W+5-i];
			b += b6 * temp[W+6-i];
			b += b7 * temp[W+7-i];
			b += b8 * temp[W+8-i];
			b += b9 * temp[W+9-i];
			b += b10 * temp[W+10-i];
			b += b11 * temp[W+11-i];
			b += b12 * temp[W+12-i];
			b += b13 * temp[W+13-i];
	  		for(k=0; k<i; ++k) {
				b += array->data[(j) * size + (k+W+1)] * temp[2*W-i+k+1];
			}
            		buffer->data[(j) * size + (i)] += b;
	      	}
      	}
	for(j = 0 ; j < M ; ++j) {
		b0 = array->data[(j) * size + (0)];
		b1 = array->data[(j) * size + (1)];
		b2 = array->data[(j) * size + (2)];
		b3 = array->data[(j) * size + (3)];
		b4 = array->data[(j) * size + (4)];
		b5 = array->data[(j) * size + (5)];
		b6 = array->data[(j) * size + (6)];
		b7 = array->data[(j) * size + (7)];
		b8 = array->data[(j) * size + (8)];
		b9 = array->data[(j) * size + (9)];
		b10 = array->data[(j) * size + (10)];
		b11 = array->data[(j) * size + (11)];
		b12 = array->data[(j) * size + (12)];
		b13 = array->data[(j) * size + (13)];
		b14 = array->data[(j) * size + (14)];
		b15 = array->data[(j) * size + (15)];
		b16 = array->data[(j) * size + (16)];
		b17 = array->data[(j) * size + (17)];
		b18 = array->data[(j) * size + (18)];
		b19 = array->data[(j) * size + (19)];
		b20 = array->data[(j) * size + (20)];
		b21 = array->data[(j) * size + (21)];
		b22 = array->data[(j) * size + (22)];
		b23 = array->data[(j) * size + (23)];
		b24 = array->data[(j) * size + (24)];
		b25 = array->data[(j) * size + (25)];
		for(i = 0 ; i < N-2*W-1; ++i) {
			b26 = array->data[(j) * size + (i+2*W)];
			
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
			b += b11 * temp[11];
			b += b12 * temp[12];
			b += b13 * temp[13];
			b += b14 * temp[14];
			b += b15 * temp[15];
			b += b16 * temp[16];
			b += b17 * temp[17];
			b += b18 * temp[18];
			b += b19 * temp[19];
			b += b20 * temp[20];
			b += b21 * temp[21];
			b += b22 * temp[22];
			b += b23 * temp[23];
			b += b24 * temp[24];
			b += b25 * temp[25];
			b += b26 * temp[26];
			
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
			b10 = b11;
			b11 = b12;
			b12 = b13;
			b13 = b14;
			b14 = b15;
			b15 = b16;
			b16 = b17;
			b17 = b18;
			b18 = b19;
			b19 = b20;
			b20 = b21;
			b21 = b22;
			b22 = b23;
			b23 = b24;
			b24 = b25;
			b25 = b26;

			buffer->data[(j) * size + (i+W)] += b;
		}
	}
	for(j = 0 ; j < M ; ++j) {
		for(i = N-W-1 ; i < N ; ++i) {
			b = array->data[(j) * size + (0+i-W)] * temp[0];
			b += array->data[(j) * size + (1+i-W)] * temp[1];
			b += array->data[(j) * size + (2+i-W)] * temp[2];
			b += array->data[(j) * size + (3+i-W)] * temp[3];
			b += array->data[(j) * size + (4+i-W)] * temp[4];
			b += array->data[(j) * size + (5+i-W)] * temp[5];
			b += array->data[(j) * size + (6+i-W)] * temp[6];
			b += array->data[(j) * size + (7+i-W)] * temp[7];
			b += array->data[(j) * size + (8+i-W)] * temp[8];
			b += array->data[(j) * size + (9+i-W)] * temp[9];
			b += array->data[(j) * size + (10+i-W)] * temp[10];
			b += array->data[(j) * size + (11+i-W)] * temp[11];
			b += array->data[(j) * size + (12+i-W)] * temp[12];
			for(k=0; k<N-i; ++k) {
				b += array->data[(j) * size + (k+i)] * temp[k+W];
			}
			buffer->data[(j) * size + (i)] += b;
		}
	}
	
	float t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13;
      	float o;
      	
	for(j = 0; j < W; ++j) {
		t0 = temp[W-j+0];
		t1 = temp[W-j+1];
		t2 = temp[W-j+2];
		t3 = temp[W-j+3];
		t4 = temp[W-j+4];
		t5 = temp[W-j+5];
		t6 = temp[W-j+6];
		t7 = temp[W-j+7];
		t8 = temp[W-j+8];
		t9 = temp[W-j+9];
		t10 = temp[W-j+10];
		t11 = temp[W-j+11];
		t12 = temp[W-j+12];
		t13 = temp[W-j+13];
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0) * size + (i)] * t0;
			o += buffer->data[(1) * size + (i)] * t1;
			o += buffer->data[(2) * size + (i)] * t2;
			o += buffer->data[(3) * size + (i)] * t3;
			o += buffer->data[(4) * size + (i)] * t4;
			o += buffer->data[(5) * size + (i)] * t5;
			o += buffer->data[(6) * size + (i)] * t6;
			o += buffer->data[(7) * size + (i)] * t7;
			o += buffer->data[(8) * size + (i)] * t8;
			o += buffer->data[(9) * size + (i)] * t9;
			o += buffer->data[(10) * size + (i)] * t10;
			o += buffer->data[(11) * size + (i)] * t11;
			o += buffer->data[(12) * size + (i)] * t12;
			o += buffer->data[(13) * size + (i)] * t13;
			for(k = 0; k < j; ++k) {
				o += buffer->data[(k+W+1) * size + (i)] * temp[2*W-j+k+1];
			}   
			out->data[(j) * size + (i)] += o;	
		}
	}
	for(j = 0; j < M-2*W-1; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j) * size + (i)] * temp[0];
			o += buffer->data[(1+j) * size + (i)] * temp[1];
			o += buffer->data[(2+j) * size + (i)] * temp[2];
			o += buffer->data[(3+j) * size + (i)] * temp[3];
			o += buffer->data[(4+j) * size + (i)] * temp[4];
			o += buffer->data[(5+j) * size + (i)] * temp[5];
			o += buffer->data[(6+j) * size + (i)] * temp[6];
			o += buffer->data[(7+j) * size + (i)] * temp[7];
			o += buffer->data[(8+j) * size + (i)] * temp[8];
			o += buffer->data[(9+j) * size + (i)] * temp[9];
			o += buffer->data[(10+j) * size + (i)] * temp[10];
			o += buffer->data[(11+j) * size + (i)] * temp[11];
			o += buffer->data[(12+j) * size + (i)] * temp[12];
			o += buffer->data[(13+j) * size + (i)] * temp[13];
			o += buffer->data[(14+j) * size + (i)] * temp[14];
			o += buffer->data[(15+j) * size + (i)] * temp[15];
			o += buffer->data[(16+j) * size + (i)] * temp[16];
			o += buffer->data[(17+j) * size + (i)] * temp[17];
			o += buffer->data[(18+j) * size + (i)] * temp[18];
			o += buffer->data[(19+j) * size + (i)] * temp[19];
			o += buffer->data[(20+j) * size + (i)] * temp[20];
			o += buffer->data[(21+j) * size + (i)] * temp[21];
			o += buffer->data[(22+j) * size + (i)] * temp[22];
			o += buffer->data[(23+j) * size + (i)] * temp[23];
			o += buffer->data[(24+j) * size + (i)] * temp[24];
			o += buffer->data[(25+j) * size + (i)] * temp[25];
			o += buffer->data[(26+j) * size + (i)] * temp[26];
			out->data[(j+W) * size + (i)] += o;
		}
	}
	for(j = M-W-1; j < M; ++j) {
		for(i = 0; i < N; ++i) {
			o = buffer->data[(0+j-W) * size + (i)] * temp[0];
			o += buffer->data[(1+j-W) * size + (i)] * temp[1];
			o += buffer->data[(2+j-W) * size + (i)] * temp[2];
			o += buffer->data[(3+j-W) * size + (i)] * temp[3];
			o += buffer->data[(4+j-W) * size + (i)] * temp[4];
			o += buffer->data[(5+j-W) * size + (i)] * temp[5];
			o += buffer->data[(6+j-W) * size + (i)] * temp[6];
			o += buffer->data[(7+j-W) * size + (i)] * temp[7];
			o += buffer->data[(8+j-W) * size + (i)] * temp[8];
			o += buffer->data[(9+j-W) * size + (i)] * temp[9];
			o += buffer->data[(10+j-W) * size + (i)] * temp[10];
			o += buffer->data[(11+j-W) * size + (i)] * temp[11];
			o += buffer->data[(12+j-W) * size + (i)] * temp[12];
			for(k = 0; k < M-j; k++) {
				o += buffer->data[(k+j) * size + (i)] * temp[k+W];
			}
			out->data[(j) * size + (i)] += o;
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


	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);
    return;
  }
  
