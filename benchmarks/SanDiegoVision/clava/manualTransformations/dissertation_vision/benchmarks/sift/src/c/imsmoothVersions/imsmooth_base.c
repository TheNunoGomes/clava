/********************************
Author: Sravanthi Kota Venkata
********************************/

#include "sift.h"
#include <math.h>
#include <assert.h>

#include <string.h>

#include <time.h>
//#include <sys/resource.h>

//struct rusage ruse;

//#define CPU_TIME (getrusage(RUSAGE_SELF,&ruse), ruse.ru_utime.tv_sec + \
    ruse.ru_stime.tv_sec + 1e-6 * \
    (ruse.ru_utime.tv_usec + ruse.ru_stime.tv_usec))

const double win_factor = 1.5 ;
const int nbins = 36 ;
const float threshold = 0.01;

/**
    This function is similar to imageBlur in common/c folder.
    Here, we can specify the sigma value for the gaussian filter
    function.
**/

void imsmooth(F2D* array, float dsigma, F2D* out)
{
  int M,N ;
  int i,j,k;
  float s ;

    //double first, second;
    // Save user and CPU start time
    //first = CPU_TIME;
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
    float acc = 0.0;
   
    buffer = fSetArray(M,N,0);
    
    for(j = 0 ; j < (2*W+1) ; ++j) // VETORIZADO com Ofast
    {
      temp[j] = (float)(expf(-0.5 * (j - W)*(j - W)/(s*s))) ;
      acc += temp[j];
    }

    for(j = 0 ; j < (2*W+1) ; ++j) // VETORIZADO com O3 e com Ofast
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
  
    fFreeHandle(buffer);
      
  } 
  else 
  {
      for(i=0;i<M*N;i++)          // VETORIZADO com O3 e com Ofast
          asubsref(out, i) = asubsref(array, i);
  }


    // Save end time
    //second = CPU_TIME;
    //printf("t - \t%.3f\n", (second - first)*1000);
  return;
}
