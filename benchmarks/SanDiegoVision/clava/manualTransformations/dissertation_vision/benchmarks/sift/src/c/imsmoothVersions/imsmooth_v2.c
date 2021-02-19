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


  void imsmooth5W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      for(j = 0 ; j < M; ++j)
        for(i = 0 ; i < W; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0) * temp[0+W-i];
          subsref(buffer,j,i) += subsref(array, j, 1) * temp[1+W-i];
          subsref(buffer,j,i) += subsref(array, j, 2) * temp[2+W-i];
          subsref(buffer,j,i) += subsref(array, j, 3) * temp[3+W-i];
          subsref(buffer,j,i) += subsref(array, j, 4) * temp[4+W-i];
          subsref(buffer,j,i) += subsref(array, j, 5) * temp[5+W-i];
          for(k=0; k< i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+W+1) * temp[k+2*W+1-i];
        }
      //Janela deslizante
      for(j = 0 ; j < M ; ++j)
        for(i = W ; i < N-W-1; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          subsref(buffer,j,i) += subsref(array, j, 8+i-W) * temp[8];
          subsref(buffer,j,i) += subsref(array, j, 9+i-W) * temp[9];
          subsref(buffer,j,i) += subsref(array, j, 10+i-W) * temp[10];
        }
      //Moldura direita
      for(j = 0 ; j < M ; ++j)
        for(i = N-W-1 ; i < N ; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          for(k=0; k<N-i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+i) * temp[k+W];
        }
      /*
      ** Convolve along the rows
      **/
      //Moldura superior
      for(j = 0; j < W; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0,i) * temp[0+W-j];
          subsref(out,j,i) += subsref(buffer,1,i) * temp[1+W-j];
          subsref(out,j,i) += subsref(buffer,2,i) * temp[2+W-j];
          subsref(out,j,i) += subsref(buffer,3,i) * temp[3+W-j];
          subsref(out,j,i) += subsref(buffer,4,i) * temp[4+W-j];
          subsref(out,j,i) += subsref(buffer,5,i) * temp[5+W-j];
          for(k=0; k<j; k++)
              subsref(out,j,i) += subsref(buffer,k+W+1,i) * temp[k+2*W+1-j];
      	}
      //Valores interiores da matriz
      for(j = W; j < M-W-1; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          subsref(out,j,i) += subsref(buffer,8+j-W,i) * temp[8];
          subsref(out,j,i) += subsref(buffer,9+j-W,i) * temp[9];
          subsref(out,j,i) += subsref(buffer,10+j-W,i) * temp[10];
        }
      //Moldura inferior
      for(j = M-W-1; j < M; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          for(k=0; k<M-j; k++)
              subsref(out,j,i) += subsref(buffer,k+j,i) * temp[k+W];
	}
      fFreeHandle(buffer);

    return;
  }
  
  void imsmooth7W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      for(j = 0 ; j < M; ++j)
        for(i = 0 ; i < W; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0) * temp[0+W-i];
          subsref(buffer,j,i) += subsref(array, j, 1) * temp[1+W-i];
          subsref(buffer,j,i) += subsref(array, j, 2) * temp[2+W-i];
          subsref(buffer,j,i) += subsref(array, j, 3) * temp[3+W-i];
          subsref(buffer,j,i) += subsref(array, j, 4) * temp[4+W-i];
          subsref(buffer,j,i) += subsref(array, j, 5) * temp[5+W-i];
          subsref(buffer,j,i) += subsref(array, j, 6) * temp[6+W-i];
          subsref(buffer,j,i) += subsref(array, j, 7) * temp[7+W-i];
          for(k=0; k< i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+W+1) * temp[k+2*W+1-i];
        }
      //Janela deslizante
      for(j = 0 ; j < M ; ++j)
        for(i = W ; i < N-W-1; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          subsref(buffer,j,i) += subsref(array, j, 8+i-W) * temp[8];
          subsref(buffer,j,i) += subsref(array, j, 9+i-W) * temp[9];
          subsref(buffer,j,i) += subsref(array, j, 10+i-W) * temp[10];
          subsref(buffer,j,i) += subsref(array, j, 11+i-W) * temp[11];
          subsref(buffer,j,i) += subsref(array, j, 12+i-W) * temp[12];
          subsref(buffer,j,i) += subsref(array, j, 13+i-W) * temp[13];
          subsref(buffer,j,i) += subsref(array, j, 14+i-W) * temp[14];
        }
      //Moldura direita
      for(j = 0 ; j < M ; ++j)
        for(i = N-W-1 ; i < N ; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          for(k=0; k<N-i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+i) * temp[k+W];
        }
      /*
      ** Convolve along the rows
      **/
      //Moldura superior
      for(j = 0; j < W; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0,i) * temp[0+W-j];
          subsref(out,j,i) += subsref(buffer,1,i) * temp[1+W-j];
          subsref(out,j,i) += subsref(buffer,2,i) * temp[2+W-j];
          subsref(out,j,i) += subsref(buffer,3,i) * temp[3+W-j];
          subsref(out,j,i) += subsref(buffer,4,i) * temp[4+W-j];
          subsref(out,j,i) += subsref(buffer,5,i) * temp[5+W-j];
          subsref(out,j,i) += subsref(buffer,6,i) * temp[6+W-j];
          subsref(out,j,i) += subsref(buffer,7,i) * temp[7+W-j];
          for(k=0; k<j; k++)
              subsref(out,j,i) += subsref(buffer,k+W+1,i) * temp[k+2*W+1-j];
      	}
      //Valores interiores da matriz
      for(j = W; j < M-W-1; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          subsref(out,j,i) += subsref(buffer,8+j-W,i) * temp[8];
          subsref(out,j,i) += subsref(buffer,9+j-W,i) * temp[9];
          subsref(out,j,i) += subsref(buffer,10+j-W,i) * temp[10];
          subsref(out,j,i) += subsref(buffer,11+j-W,i) * temp[11];
          subsref(out,j,i) += subsref(buffer,12+j-W,i) * temp[12];
          subsref(out,j,i) += subsref(buffer,13+j-W,i) * temp[13];
          subsref(out,j,i) += subsref(buffer,14+j-W,i) * temp[14];
        }
      //Moldura inferior
      for(j = M-W-1; j < M; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          for(k=0; k<M-j; k++)
              subsref(out,j,i) += subsref(buffer,k+j,i) * temp[k+W];
	}

      fFreeHandle(buffer);

    return;
  }
  
  void imsmooth8W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      for(j = 0 ; j < M; ++j)
        for(i = 0 ; i < W; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0) * temp[0+W-i];
          subsref(buffer,j,i) += subsref(array, j, 1) * temp[1+W-i];
          subsref(buffer,j,i) += subsref(array, j, 2) * temp[2+W-i];
          subsref(buffer,j,i) += subsref(array, j, 3) * temp[3+W-i];
          subsref(buffer,j,i) += subsref(array, j, 4) * temp[4+W-i];
          subsref(buffer,j,i) += subsref(array, j, 5) * temp[5+W-i];
          subsref(buffer,j,i) += subsref(array, j, 6) * temp[6+W-i];
          subsref(buffer,j,i) += subsref(array, j, 7) * temp[7+W-i];
          subsref(buffer,j,i) += subsref(array, j, 8) * temp[8+W-i];
          for(k=0; k< i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+W+1) * temp[k+2*W+1-i];
        }
      //Janela deslizante
      for(j = 0 ; j < M ; ++j)
        for(i = W ; i < N-W-1; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          subsref(buffer,j,i) += subsref(array, j, 8+i-W) * temp[8];
          subsref(buffer,j,i) += subsref(array, j, 9+i-W) * temp[9];
          subsref(buffer,j,i) += subsref(array, j, 10+i-W) * temp[10];
          subsref(buffer,j,i) += subsref(array, j, 11+i-W) * temp[11];
          subsref(buffer,j,i) += subsref(array, j, 12+i-W) * temp[12];
          subsref(buffer,j,i) += subsref(array, j, 13+i-W) * temp[13];
          subsref(buffer,j,i) += subsref(array, j, 14+i-W) * temp[14];
          subsref(buffer,j,i) += subsref(array, j, 15+i-W) * temp[15];
          subsref(buffer,j,i) += subsref(array, j, 16+i-W) * temp[16];
        }
      //Moldura direita
      for(j = 0 ; j < M ; ++j)
        for(i = N-W-1 ; i < N ; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          for(k=0; k<N-i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+i) * temp[k+W];
        }
      /*
      ** Convolve along the rows
      **/
      //Moldura superior
      for(j = 0; j < W; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0,i) * temp[0+W-j];
          subsref(out,j,i) += subsref(buffer,1,i) * temp[1+W-j];
          subsref(out,j,i) += subsref(buffer,2,i) * temp[2+W-j];
          subsref(out,j,i) += subsref(buffer,3,i) * temp[3+W-j];
          subsref(out,j,i) += subsref(buffer,4,i) * temp[4+W-j];
          subsref(out,j,i) += subsref(buffer,5,i) * temp[5+W-j];
          subsref(out,j,i) += subsref(buffer,6,i) * temp[6+W-j];
          subsref(out,j,i) += subsref(buffer,7,i) * temp[7+W-j];
          subsref(out,j,i) += subsref(buffer,8,i) * temp[8+W-j];
          for(k=0; k<j; k++)
              subsref(out,j,i) += subsref(buffer,k+W+1,i) * temp[k+2*W+1-j];
      	}
      //Valores interiores da matriz
      for(j = W; j < M-W-1; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          subsref(out,j,i) += subsref(buffer,8+j-W,i) * temp[8];
          subsref(out,j,i) += subsref(buffer,9+j-W,i) * temp[9];
          subsref(out,j,i) += subsref(buffer,10+j-W,i) * temp[10];
          subsref(out,j,i) += subsref(buffer,11+j-W,i) * temp[11];
          subsref(out,j,i) += subsref(buffer,12+j-W,i) * temp[12];
          subsref(out,j,i) += subsref(buffer,13+j-W,i) * temp[13];
          subsref(out,j,i) += subsref(buffer,14+j-W,i) * temp[14];
          subsref(out,j,i) += subsref(buffer,15+j-W,i) * temp[15];
          subsref(out,j,i) += subsref(buffer,16+j-W,i) * temp[16];
        }
      //Moldura inferior
      for(j = M-W-1; j < M; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          for(k=0; k<M-j; k++)
              subsref(out,j,i) += subsref(buffer,k+j,i) * temp[k+W];
	}
	
      fFreeHandle(buffer);

    return;
  }
  
  void imsmooth10W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      for(j = 0 ; j < M; ++j)
        for(i = 0 ; i < W; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0) * temp[0+W-i];
          subsref(buffer,j,i) += subsref(array, j, 1) * temp[1+W-i];
          subsref(buffer,j,i) += subsref(array, j, 2) * temp[2+W-i];
          subsref(buffer,j,i) += subsref(array, j, 3) * temp[3+W-i];
          subsref(buffer,j,i) += subsref(array, j, 4) * temp[4+W-i];
          subsref(buffer,j,i) += subsref(array, j, 5) * temp[5+W-i];
          subsref(buffer,j,i) += subsref(array, j, 6) * temp[6+W-i];
          subsref(buffer,j,i) += subsref(array, j, 7) * temp[7+W-i];
          subsref(buffer,j,i) += subsref(array, j, 8) * temp[8+W-i];
          subsref(buffer,j,i) += subsref(array, j, 9) * temp[9+W-i];
          subsref(buffer,j,i) += subsref(array, j, 10) * temp[10+W-i];
          for(k=0; k< i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+W+1) * temp[k+2*W+1-i];
        }
      //Janela deslizante
      for(j = 0 ; j < M ; ++j)
        for(i = W ; i < N-W-1; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          subsref(buffer,j,i) += subsref(array, j, 8+i-W) * temp[8];
          subsref(buffer,j,i) += subsref(array, j, 9+i-W) * temp[9];
          subsref(buffer,j,i) += subsref(array, j, 10+i-W) * temp[10];
          subsref(buffer,j,i) += subsref(array, j, 11+i-W) * temp[11];
          subsref(buffer,j,i) += subsref(array, j, 12+i-W) * temp[12];
          subsref(buffer,j,i) += subsref(array, j, 13+i-W) * temp[13];
          subsref(buffer,j,i) += subsref(array, j, 14+i-W) * temp[14];
          subsref(buffer,j,i) += subsref(array, j, 15+i-W) * temp[15];
          subsref(buffer,j,i) += subsref(array, j, 16+i-W) * temp[16];
          subsref(buffer,j,i) += subsref(array, j, 17+i-W) * temp[17];
          subsref(buffer,j,i) += subsref(array, j, 18+i-W) * temp[18];
          subsref(buffer,j,i) += subsref(array, j, 19+i-W) * temp[19];
          subsref(buffer,j,i) += subsref(array, j, 20+i-W) * temp[20];
        }
      //Moldura direita
      for(j = 0 ; j < M ; ++j)
        for(i = N-W-1 ; i < N ; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          subsref(buffer,j,i) += subsref(array, j, 8+i-W) * temp[8];
          subsref(buffer,j,i) += subsref(array, j, 9+i-W) * temp[9];
          for(k=0; k<N-i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+i) * temp[k+W];
        }
      /*
      ** Convolve along the rows
      **/
      //Moldura superior
      for(j = 0; j < W; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0,i) * temp[0+W-j];
          subsref(out,j,i) += subsref(buffer,1,i) * temp[1+W-j];
          subsref(out,j,i) += subsref(buffer,2,i) * temp[2+W-j];
          subsref(out,j,i) += subsref(buffer,3,i) * temp[3+W-j];
          subsref(out,j,i) += subsref(buffer,4,i) * temp[4+W-j];
          subsref(out,j,i) += subsref(buffer,5,i) * temp[5+W-j];
          subsref(out,j,i) += subsref(buffer,6,i) * temp[6+W-j];
          subsref(out,j,i) += subsref(buffer,7,i) * temp[7+W-j];
          subsref(out,j,i) += subsref(buffer,8,i) * temp[8+W-j];
          subsref(out,j,i) += subsref(buffer,9,i) * temp[9+W-j];
          subsref(out,j,i) += subsref(buffer,10,i) * temp[10+W-j];
          for(k=0; k<j; k++)
              subsref(out,j,i) += subsref(buffer,k+W+1,i) * temp[k+2*W+1-j];
      	}
      //Valores interiores da matriz
      for(j = W; j < M-W-1; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          subsref(out,j,i) += subsref(buffer,8+j-W,i) * temp[8];
          subsref(out,j,i) += subsref(buffer,9+j-W,i) * temp[9];
          subsref(out,j,i) += subsref(buffer,10+j-W,i) * temp[10];
          subsref(out,j,i) += subsref(buffer,11+j-W,i) * temp[11];
          subsref(out,j,i) += subsref(buffer,12+j-W,i) * temp[12];
          subsref(out,j,i) += subsref(buffer,13+j-W,i) * temp[13];
          subsref(out,j,i) += subsref(buffer,14+j-W,i) * temp[14];
          subsref(out,j,i) += subsref(buffer,15+j-W,i) * temp[15];
          subsref(out,j,i) += subsref(buffer,16+j-W,i) * temp[16];
          subsref(out,j,i) += subsref(buffer,17+j-W,i) * temp[17];
          subsref(out,j,i) += subsref(buffer,18+j-W,i) * temp[18];
          subsref(out,j,i) += subsref(buffer,19+j-W,i) * temp[19];
          subsref(out,j,i) += subsref(buffer,20+j-W,i) * temp[20];
        }
      //Moldura inferior
      for(j = M-W-1; j < M; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          subsref(out,j,i) += subsref(buffer,8+j-W,i) * temp[8];
          subsref(out,j,i) += subsref(buffer,9+j-W,i) * temp[9];
          for(k=0; k<M-j; k++)
              subsref(out,j,i) += subsref(buffer,k+j,i) * temp[k+W];
	}
	
      fFreeHandle(buffer);

    return;
  }
  
  void imsmooth13W(F2D* array, float dsigma, F2D* out)
  {
    int M,N;
    int i,j,k;
    float s;

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

      for(j = 0 ; j < M; ++j)
        for(i = 0 ; i < W; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0) * temp[0+W-i];
          subsref(buffer,j,i) += subsref(array, j, 1) * temp[1+W-i];
          subsref(buffer,j,i) += subsref(array, j, 2) * temp[2+W-i];
          subsref(buffer,j,i) += subsref(array, j, 3) * temp[3+W-i];
          subsref(buffer,j,i) += subsref(array, j, 4) * temp[4+W-i];
          subsref(buffer,j,i) += subsref(array, j, 5) * temp[5+W-i];
          subsref(buffer,j,i) += subsref(array, j, 6) * temp[6+W-i];
          subsref(buffer,j,i) += subsref(array, j, 7) * temp[7+W-i];
          subsref(buffer,j,i) += subsref(array, j, 8) * temp[8+W-i];
          subsref(buffer,j,i) += subsref(array, j, 9) * temp[9+W-i];
          subsref(buffer,j,i) += subsref(array, j, 10) * temp[10+W-i];
          subsref(buffer,j,i) += subsref(array, j, 11) * temp[11+W-i];
          subsref(buffer,j,i) += subsref(array, j, 12) * temp[12+W-i];
          subsref(buffer,j,i) += subsref(array, j, 13) * temp[13+W-i];
          for(k=0; k< i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+W+1) * temp[k+2*W+1-i];
        }
      //Janela deslizante
      for(j = 0 ; j < M ; ++j)
        for(i = W ; i < N-W-1; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          subsref(buffer,j,i) += subsref(array, j, 8+i-W) * temp[8];
          subsref(buffer,j,i) += subsref(array, j, 9+i-W) * temp[9];
          subsref(buffer,j,i) += subsref(array, j, 10+i-W) * temp[10];
          subsref(buffer,j,i) += subsref(array, j, 11+i-W) * temp[11];
          subsref(buffer,j,i) += subsref(array, j, 12+i-W) * temp[12];
          subsref(buffer,j,i) += subsref(array, j, 13+i-W) * temp[13];
          subsref(buffer,j,i) += subsref(array, j, 14+i-W) * temp[14];
          subsref(buffer,j,i) += subsref(array, j, 15+i-W) * temp[15];
          subsref(buffer,j,i) += subsref(array, j, 16+i-W) * temp[16];
          subsref(buffer,j,i) += subsref(array, j, 17+i-W) * temp[17];
          subsref(buffer,j,i) += subsref(array, j, 18+i-W) * temp[18];
          subsref(buffer,j,i) += subsref(array, j, 19+i-W) * temp[19];
          subsref(buffer,j,i) += subsref(array, j, 20+i-W) * temp[20];
          subsref(buffer,j,i) += subsref(array, j, 21+i-W) * temp[21];
          subsref(buffer,j,i) += subsref(array, j, 22+i-W) * temp[22];
          subsref(buffer,j,i) += subsref(array, j, 23+i-W) * temp[23];
          subsref(buffer,j,i) += subsref(array, j, 24+i-W) * temp[24];
          subsref(buffer,j,i) += subsref(array, j, 25+i-W) * temp[25];
          subsref(buffer,j,i) += subsref(array, j, 26+i-W) * temp[26];
        }
      //Moldura direita
      for(j = 0 ; j < M ; ++j)
        for(i = N-W-1 ; i < N ; ++i)
        {
          subsref(buffer,j,i) += subsref(array, j, 0+i-W) * temp[0];
          subsref(buffer,j,i) += subsref(array, j, 1+i-W) * temp[1];
          subsref(buffer,j,i) += subsref(array, j, 2+i-W) * temp[2];
          subsref(buffer,j,i) += subsref(array, j, 3+i-W) * temp[3];
          subsref(buffer,j,i) += subsref(array, j, 4+i-W) * temp[4];
          subsref(buffer,j,i) += subsref(array, j, 5+i-W) * temp[5];
          subsref(buffer,j,i) += subsref(array, j, 6+i-W) * temp[6];
          subsref(buffer,j,i) += subsref(array, j, 7+i-W) * temp[7];
          subsref(buffer,j,i) += subsref(array, j, 8+i-W) * temp[8];
          subsref(buffer,j,i) += subsref(array, j, 9+i-W) * temp[9];
          subsref(buffer,j,i) += subsref(array, j, 10+i-W) * temp[10];
          subsref(buffer,j,i) += subsref(array, j, 11+i-W) * temp[11];
          subsref(buffer,j,i) += subsref(array, j, 12+i-W) * temp[12];
          for(k=0; k<N-i; k++)
              subsref(buffer,j,i) += subsref(array, j, k+i) * temp[k+W];
        }
      /*
      ** Convolve along the rows
      **/
      //Moldura superior
      for(j = 0; j < W; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0,i) * temp[0+W-j];
          subsref(out,j,i) += subsref(buffer,1,i) * temp[1+W-j];
          subsref(out,j,i) += subsref(buffer,2,i) * temp[2+W-j];
          subsref(out,j,i) += subsref(buffer,3,i) * temp[3+W-j];
          subsref(out,j,i) += subsref(buffer,4,i) * temp[4+W-j];
          subsref(out,j,i) += subsref(buffer,5,i) * temp[5+W-j];
          subsref(out,j,i) += subsref(buffer,6,i) * temp[6+W-j];
          subsref(out,j,i) += subsref(buffer,7,i) * temp[7+W-j];
          subsref(out,j,i) += subsref(buffer,8,i) * temp[8+W-j];
          subsref(out,j,i) += subsref(buffer,9,i) * temp[9+W-j];
          subsref(out,j,i) += subsref(buffer,10,i) * temp[10+W-j];
          subsref(out,j,i) += subsref(buffer,11,i) * temp[11+W-j];
          subsref(out,j,i) += subsref(buffer,11,i) * temp[12+W-j];
          subsref(out,j,i) += subsref(buffer,13,i) * temp[13+W-j];
          for(k=0; k<j; k++)
              subsref(out,j,i) += subsref(buffer,k+W+1,i) * temp[k+2*W+1-j];
      	}
      //Valores interiores da matriz
      for(j = W; j < M-W-1; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          subsref(out,j,i) += subsref(buffer,8+j-W,i) * temp[8];
          subsref(out,j,i) += subsref(buffer,9+j-W,i) * temp[9];
          subsref(out,j,i) += subsref(buffer,10+j-W,i) * temp[10];
          subsref(out,j,i) += subsref(buffer,11+j-W,i) * temp[11];
          subsref(out,j,i) += subsref(buffer,12+j-W,i) * temp[12];
          subsref(out,j,i) += subsref(buffer,13+j-W,i) * temp[13];
          subsref(out,j,i) += subsref(buffer,14+j-W,i) * temp[14];
          subsref(out,j,i) += subsref(buffer,15+j-W,i) * temp[15];
          subsref(out,j,i) += subsref(buffer,16+j-W,i) * temp[16];
          subsref(out,j,i) += subsref(buffer,17+j-W,i) * temp[17];
          subsref(out,j,i) += subsref(buffer,18+j-W,i) * temp[18];
          subsref(out,j,i) += subsref(buffer,19+j-W,i) * temp[19];
          subsref(out,j,i) += subsref(buffer,20+j-W,i) * temp[20];
          subsref(out,j,i) += subsref(buffer,21+j-W,i) * temp[21];
          subsref(out,j,i) += subsref(buffer,22+j-W,i) * temp[22];
          subsref(out,j,i) += subsref(buffer,23+j-W,i) * temp[23];
          subsref(out,j,i) += subsref(buffer,24+j-W,i) * temp[24];
          subsref(out,j,i) += subsref(buffer,25+j-W,i) * temp[25];
          subsref(out,j,i) += subsref(buffer,26+j-W,i) * temp[26];
        }
      //Moldura inferior
      for(j = M-W-1; j < M; ++j)
        for(i = 0; i < N; ++i)
        {
          subsref(out,j,i) += subsref(buffer,0+j-W,i) * temp[0];
          subsref(out,j,i) += subsref(buffer,1+j-W,i) * temp[1];
          subsref(out,j,i) += subsref(buffer,2+j-W,i) * temp[2];
          subsref(out,j,i) += subsref(buffer,3+j-W,i) * temp[3];
          subsref(out,j,i) += subsref(buffer,4+j-W,i) * temp[4];
          subsref(out,j,i) += subsref(buffer,5+j-W,i) * temp[5];
          subsref(out,j,i) += subsref(buffer,6+j-W,i) * temp[6];
          subsref(out,j,i) += subsref(buffer,7+j-W,i) * temp[7];
          subsref(out,j,i) += subsref(buffer,8+j-W,i) * temp[8];
          subsref(out,j,i) += subsref(buffer,9+j-W,i) * temp[9];
          subsref(out,j,i) += subsref(buffer,10+j-W,i) * temp[10];
          subsref(out,j,i) += subsref(buffer,11+j-W,i) * temp[11];
          subsref(out,j,i) += subsref(buffer,12+j-W,i) * temp[12];
          for(k=0; k<M-j; k++)
              subsref(out,j,i) += subsref(buffer,k+j,i) * temp[k+W];
	}
      fFreeHandle(buffer);

    return;
  }
  
