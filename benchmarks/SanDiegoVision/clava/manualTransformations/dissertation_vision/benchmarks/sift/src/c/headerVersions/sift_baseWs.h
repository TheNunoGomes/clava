/********************************
Author: Sravanthi Kota Venkata
********************************/

#ifndef _SIFT_
#define _SIFT_

#include "sdvbs_common.h"
#include <assert.h>

#define GREATER(a,b) ((a) > (b))
#define MAX(a,b) (((a)>(b))?(a):(b))
#define MIN(a,b) (((a)<(b))?(a):(b))

F2D* sift(F2D* I);
F2D* halveSize(F2D* I);
F2D** gaussianss(F2D* I, float sigman, int O, int S, int omin, int smin, int smax, float sigma0);
F2D** diffss(F2D** ss, int O, int intervals);
F2D* doubleSize(F2D* I);
void imsmooth(F2D* I_pt, float dsigma, F2D* out);
void imsmooth2160(F2D* I_pt, float dsigma, F2D* out);
void imsmooth1080(F2D* I_pt, float dsigma, F2D* out);
void imsmooth540(F2D* I_pt, float dsigma, F2D* out);
void imsmooth270(F2D* I_pt, float dsigma, F2D* out);
void imsmooth135(F2D* I_pt, float dsigma, F2D* out);
void imsmooth68(F2D* I_pt, float dsigma, F2D* out);
void imsmooth34(F2D* I_pt, float dsigma, F2D* out);
void imsmooth5W(F2D* I_pt, float dsigma, F2D* out, int w);
void imsmooth7W(F2D* I_pt, float dsigma, F2D* out, int w);
void imsmooth8W(F2D* I_pt, float dsigma, F2D* out, int w);
void imsmooth10W(F2D* I_pt, float dsigma, F2D* out, int w);
void imsmooth13W(F2D* I_pt, float dsigma, F2D* out, int w);
F2D* siftlocalmax(F2D* in, float thresh, int intervals, int M, int N);
F2D* filterBoundaryPoints(int M, int N, F2D* oframes); 
F2D* siftrefinemx(F2D* oframes, F2D* dogss, int smin, float thresh, int rin, int M, int N, int intervals);

#endif


