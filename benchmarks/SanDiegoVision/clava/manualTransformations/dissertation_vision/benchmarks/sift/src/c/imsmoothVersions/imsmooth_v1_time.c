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

const double win_factor = 1.5;
const int nbins = 36;
const float threshold = 0.01;

/**
    This function is similar to imageBlur in common/c folder.
    Here, we can specify the sigma value for the gaussian filter
    function.
**/

void imsmooth(F2D *array, float dsigma, F2D *out)
{
  int M, N;
  int i, j, k;
  float s;

  printf("W = %d\t\t\t ", (int)ceil(4 * dsigma));
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
  if (s > threshold)
  {
    int W = (int)ceil(4 * s);
    float temp[2 * W + 1];
    F2D *buffer;
    float acc = 0.0;

    buffer = fSetArray(M, N, 0);

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] = (float)(expf(-0.5 * (j - W) * (j - W) / (s * s)));
      acc += temp[j];
    }

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] /= acc;
    }

    /*
    ** Convolve along the columns
    **/

    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startCol = MAX(i - W, 0);
        int endCol = MIN(i + W, N - 1);
        int filterStart = MAX(0, W - i);
        for (k = startCol; k <= endCol; k++)
          subsref(buffer, j, i) += subsref(array, j, k) * temp[filterStart++];
      }
    }

    /*
    ** Convolve along the rows
    **/
    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startRow = MAX(j - W, 0);
        int endRow = MIN(j + W, M - 1);
        int filterStart = MAX(0, W - j);
        for (k = startRow; k <= endRow; k++)
          subsref(out, j, i) += subsref(buffer, k, i) * temp[filterStart++];
      }
    }

    fFreeHandle(buffer);
  }
  else
  {
    for (i = 0; i < M * N; i++)
      asubsref(out, i) = asubsref(array, i);
  }

  clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
  double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double)clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double)clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
  printf("%f\n", clava_timing_duration_0);
  return;
}

void imsmooth5W(F2D *array, float dsigma, F2D *out)
{
  int M, N;
  int i, j, k;
  float s;
  printf("W = 5\t\t\t ");
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
  if (s > threshold)
  {
    int W = 5;
    float temp[2 * W + 1];
    F2D *buffer;
    float acc = 0.0;

    buffer = fSetArray(M, N, 0);

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] = (float)(expf(-0.5 * (j - W) * (j - W) / (s * s)));
      acc += temp[j];
    }

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] /= acc;
    }

    /*
    ** Convolve along the columns
    **/

    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startCol = MAX(i - W, 0);
        int endCol = MIN(i + W, N - 1);
        int filterStart = MAX(0, W - i);
        for (k = startCol; k <= endCol; k++)
          subsref(buffer, j, i) += subsref(array, j, k) * temp[filterStart++];
      }
    }

    /*
    ** Convolve along the rows
    **/
    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startRow = MAX(j - W, 0);
        int endRow = MIN(j + W, M - 1);
        int filterStart = MAX(0, W - j);
        for (k = startRow; k <= endRow; k++)
          subsref(out, j, i) += subsref(buffer, k, i) * temp[filterStart++];
      }
    }

    fFreeHandle(buffer);
  }
  else
  {
    for (i = 0; i < M * N; i++)
      asubsref(out, i) = asubsref(array, i);
  }

  clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
  double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double)clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double)clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
  printf("%f\n", clava_timing_duration_0);
  return;
}

void imsmooth7W(F2D *array, float dsigma, F2D *out)
{
  int M, N;
  int i, j, k;
  float s;
  printf("W = 7\t\t\t ");
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
  if (s > threshold)
  {
    int W = 7;
    float temp[2 * W + 1];
    F2D *buffer;
    float acc = 0.0;

    buffer = fSetArray(M, N, 0);

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] = (float)(expf(-0.5 * (j - W) * (j - W) / (s * s)));
      acc += temp[j];
    }

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] /= acc;
    }

    /*
    ** Convolve along the columns
    **/

    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startCol = MAX(i - W, 0);
        int endCol = MIN(i + W, N - 1);
        int filterStart = MAX(0, W - i);
        for (k = startCol; k <= endCol; k++)
          subsref(buffer, j, i) += subsref(array, j, k) * temp[filterStart++];
      }
    }

    /*
    ** Convolve along the rows
    **/
    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startRow = MAX(j - W, 0);
        int endRow = MIN(j + W, M - 1);
        int filterStart = MAX(0, W - j);
        for (k = startRow; k <= endRow; k++)
          subsref(out, j, i) += subsref(buffer, k, i) * temp[filterStart++];
      }
    }

    fFreeHandle(buffer);
  }
  else
  {
    for (i = 0; i < M * N; i++)
      asubsref(out, i) = asubsref(array, i);
  }

  clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
  double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double)clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double)clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
  printf("%f\n", clava_timing_duration_0);
  return;
}

void imsmooth8W(F2D *array, float dsigma, F2D *out)
{
  int M, N;
  int i, j, k;
  float s;
  printf("W = 8\t\t\t ");
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
  if (s > threshold)
  {
    int W = 8;
    float temp[2 * W + 1];
    F2D *buffer;
    float acc = 0.0;

    buffer = fSetArray(M, N, 0);

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] = (float)(expf(-0.5 * (j - W) * (j - W) / (s * s)));
      acc += temp[j];
    }

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] /= acc;
    }

    /*
    ** Convolve along the columns
    **/

    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startCol = MAX(i - W, 0);
        int endCol = MIN(i + W, N - 1);
        int filterStart = MAX(0, W - i);
        for (k = startCol; k <= endCol; k++)
          subsref(buffer, j, i) += subsref(array, j, k) * temp[filterStart++];
      }
    }

    /*
    ** Convolve along the rows
    **/
    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startRow = MAX(j - W, 0);
        int endRow = MIN(j + W, M - 1);
        int filterStart = MAX(0, W - j);
        for (k = startRow; k <= endRow; k++)
          subsref(out, j, i) += subsref(buffer, k, i) * temp[filterStart++];
      }
    }

    fFreeHandle(buffer);
  }
  else
  {
    for (i = 0; i < M * N; i++)
      asubsref(out, i) = asubsref(array, i);
  }

  clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
  double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double)clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double)clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
  printf("%f\n", clava_timing_duration_0);
  return;
}

void imsmooth10W(F2D *array, float dsigma, F2D *out)
{
  int M, N;
  int i, j, k;
  float s;
  printf("W = 10\t\t\t ");
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
  if (s > threshold)
  {
    int W = 10;
    float temp[2 * W + 1];
    F2D *buffer;
    float acc = 0.0;

    buffer = fSetArray(M, N, 0);

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] = (float)(expf(-0.5 * (j - W) * (j - W) / (s * s)));
      acc += temp[j];
    }

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] /= acc;
    }

    /*
    ** Convolve along the columns
    **/

    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startCol = MAX(i - W, 0);
        int endCol = MIN(i + W, N - 1);
        int filterStart = MAX(0, W - i);
        for (k = startCol; k <= endCol; k++)
          subsref(buffer, j, i) += subsref(array, j, k) * temp[filterStart++];
      }
    }

    /*
    ** Convolve along the rows
    **/
    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startRow = MAX(j - W, 0);
        int endRow = MIN(j + W, M - 1);
        int filterStart = MAX(0, W - j);
        for (k = startRow; k <= endRow; k++)
          subsref(out, j, i) += subsref(buffer, k, i) * temp[filterStart++];
      }
    }

    fFreeHandle(buffer);
  }
  else
  {
    for (i = 0; i < M * N; i++)
      asubsref(out, i) = asubsref(array, i);
  }

  clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
  double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double)clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double)clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
  printf("%f\n", clava_timing_duration_0);
  return;
}

void imsmooth13W(F2D *array, float dsigma, F2D *out)
{
  int M, N;
  int i, j, k;
  float s;

  printf("W = 13\t\t\t ";
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
  if (s > threshold)
  {
    int W = 13;
    float temp[2 * W + 1];
    F2D *buffer;
    float acc = 0.0;

    buffer = fSetArray(M, N, 0);

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] = (float)(expf(-0.5 * (j - W) * (j - W) / (s * s)));
      acc += temp[j];
    }

    for (j = 0; j < (2 * W + 1); ++j)
    {
      temp[j] /= acc;
    }

    /*
    ** Convolve along the columns
    **/

    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startCol = MAX(i - W, 0);
        int endCol = MIN(i + W, N - 1);
        int filterStart = MAX(0, W - i);
        for (k = startCol; k <= endCol; k++)
          subsref(buffer, j, i) += subsref(array, j, k) * temp[filterStart++];
      }
    }

    /*
    ** Convolve along the rows
    **/
    for (j = 0; j < M; ++j)
    {
      for (i = 0; i < N; ++i)
      {
        int startRow = MAX(j - W, 0);
        int endRow = MIN(j + W, M - 1);
        int filterStart = MAX(0, W - j);
        for (k = startRow; k <= endRow; k++)
          subsref(out, j, i) += subsref(buffer, k, i) * temp[filterStart++];
      }
    }

    fFreeHandle(buffer);
  }
  else
  {
    for (i = 0; i < M * N; i++)
      asubsref(out, i) = asubsref(array, i);
  }

  clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
  double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double)clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double)clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
  printf("%f\n", clava_timing_duration_0);
  return;
}