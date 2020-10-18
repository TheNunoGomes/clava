#include "sift.h"
int const max_iter = 5;
/**

SIFTREFINEMX  Subpixel localization, thresholding and on-edge test
Q = SIFTREFINEMX(P, OCTAVE, SMIN) refines, thresholds and performs
the on-edge test for the SIFT frames P extracted from the DOG
octave OCTAVE with parameter SMIN (see GAUSSIANSS()).

Q = SIFTREFINEMX(P, OCTAVE, SMIN, THRESH, R) specifies custom
values for the local maximum strength threshold THRESH and the
local maximum peakedeness threshold R.

OCTAVE is an octave of the Difference Of Gaussian scale space. P
is a 3xK matrix specifying the indexes (X,Y,S) of the points of
extremum of the octave OCTAVE. The spatial indexes X,Y are integer
with base zero. The scale index S is integer with base SMIN and
represents a scale sublevel in the specified octave.

The function returns a matrix Q containing the refined keypoints.
The matrix has the same format as P, except that the indexes are
now fractional. The function drops the points that do not satisfy
the strength and peakedness tests.

**/
F2D * siftrefinemx(F2D *oframes, F2D *dogss, int smin, float thresh, int r, int M, int N, int intervals) {
   int S, K;
   F2D *out;
   /*-----------------------------------------------------------------
   **                                               Check the arguments
   ** --------------------------------------------------------------*/
   S = intervals;
   K = oframes->height;
   /*If the input array is empty, then output an empty array as well.*/
   if(K == 0) {
      out = fDeepCopy(oframes);
      
      return out;
   }
   /*-----------------------------------------------------------------
   *                                                        Do the job
   * --------------------------------------------------------------*/
   {
      F2D *buffer = fMallocHandle(K, 3);
      int p;
      int const yo = 1;
      int const xo = M;
      int const so = M * N;
      int buffCounter = 0;
      int pptcount = 0;
      for(p = 0; p < K; ++p) {
         float tx, ty, ts;
         int x, y, s;
         int iter;
         float b[3];
         tx = oframes->data[pptcount++];
         ty = oframes->data[pptcount++];
         ts = oframes->data[pptcount++];
         x = ceil(tx);
         y = ceil(ty);
         s = ceil(ts) - smin;
         /*Local maxima extracted from the DOG
         * have coorrinates 1<=x<=N-2, 1<=y<=M-2
         * and 1<=s-mins<=S-2. This is also the range of the points
         * that we can refine.
         */
         if(x < 1 || x > N - 2 || y < 1 || y > M - 2 || s < 1 || s > S - 2) {
            continue;
         }
         {
            float Dx = 0, Dy = 0, Ds = 0, Dxx = 0, Dyy = 0, Dss = 0, Dxy = 0, Dxs = 0, Dys = 0;
            int dx = 0;
            int dy = 0;
            for(iter = 0; iter < max_iter; ++iter) {
               float A[9];
               x += dx;
               y += dy;
               /*Compute the gradient.*/
               Dx = 0.5 * (dogss->data[(x + 1) * xo + (y + 0) * yo + (s + 0) * so] - dogss->data[(x - 1) * xo + (y + 0) * yo + (s + 0) * so]);
               Dy = 0.5 * (dogss->data[(x + 0) * xo + (y + 1) * yo + (s + 0) * so] - dogss->data[(x + 0) * xo + (y - 1) * yo + (s + 0) * so]);
               Ds = 0.5 * (dogss->data[(x + 0) * xo + (y + 0) * yo + (s + 1) * so] - dogss->data[(x + 0) * xo + (y + 0) * yo + (s - 1) * so]);
               /*Compute the Hessian.*/
               Dxx = (dogss->data[(x + 1) * xo + (y) * yo + (s) * so] + dogss->data[(x - 1) * xo + (y) * yo + (s) * so] - 2.0 * dogss->data[(x) * xo + (y) * yo + (s) * so]);
               Dyy = (dogss->data[(x) * xo + (y + 1) * yo + (s) * so] + dogss->data[(x) * xo + (y - 1) * yo + (s) * so] - 2.0 * dogss->data[(x) * xo + (y) * yo + (s) * so]);
               Dss = (dogss->data[(x) * xo + (y) * yo + (s + 1) * so] + dogss->data[(x) * xo + (y) * yo + (s - 1) * so] - 2.0 * dogss->data[(x) * xo + (y) * yo + (s) * so]);
               Dxy = 0.25 * (dogss->data[(x + 1) * xo + (y + 1) * yo + (s) * so] + dogss->data[(x - 1) * xo + (y - 1) * yo + (s) * so] - dogss->data[(x - 1) * xo + (y + 1) * yo + (s) * so] - dogss->data[(x + 1) * xo + (y - 1) * yo + (s) * so]);
               Dxs = 0.25 * (dogss->data[(x + 1) * xo + (y) * yo + (s + 1) * so] + dogss->data[(x - 1) * xo + (y) * yo + (s - 1) * so] - dogss->data[(x - 1) * xo + (y) * yo + (s + 1) * so] - dogss->data[(x + 1) * xo + (y) * yo + (s - 1) * so]);
               Dys = 0.25 * (dogss->data[(x) * xo + (y + 1) * yo + (s + 1) * so] + dogss->data[(x) * xo + (y - 1) * yo + (s - 1) * so] - dogss->data[(x) * xo + (y - 1) * yo + (s + 1) * so] - dogss->data[(x) * xo + (y + 1) * yo + (s - 1) * so]);
               /*Solve linear system.*/
               (A[(0) + (0) * 3]) = Dxx;
               (A[(1) + (1) * 3]) = Dyy;
               (A[(2) + (2) * 3]) = Dss;
               (A[(0) + (1) * 3]) = (A[(1) + (0) * 3]) = Dxy;
               (A[(0) + (2) * 3]) = (A[(2) + (0) * 3]) = Dxs;
               (A[(1) + (2) * 3]) = (A[(2) + (1) * 3]) = Dys;
               b[0] = -Dx;
               b[1] = -Dy;
               b[2] = -Ds;
               /*If the translation of the keypoint is big, move the keypoint
               * and re-iterate the computation. Otherwise we are all set.
               */
               dx = ((b[0] > 0.6 && x < N - 2) ? 1 : 0) + ((b[0] < -0.6 && x > 1) ? -1 : 0);
               dy = ((b[1] > 0.6 && y < M - 2) ? 1 : 0) + ((b[1] < -0.6 && y > 1) ? -1 : 0);
               if(dx == 0 && dy == 0) break;
            }
            {
               float val = dogss->data[(x) * xo + (y) * yo + (s) * so] + 0.5 * (Dx * b[0] + Dy * b[1] + Ds * b[2]);
               float score = (Dxx + Dyy) * (Dxx + Dyy) / (Dxx * Dyy - Dxy * Dxy);
               float xn = x + b[0];
               float yn = y + b[1];
               float sn = s + b[2];
               if(fabs(val) > thresh && score < (r + 1) * (r + 1) / r && score >= 0 && fabs(b[0]) < 1.5 && fabs(b[1]) < 1.5 && fabs(b[2]) < 1.5 && xn >= 0 && xn <= N - 1 && yn >= 0 && yn <= M - 1 && sn >= 0 && sn <= S - 1) {
                  buffer->data[buffCounter++] = xn;
                  buffer->data[buffCounter++] = yn;
                  buffer->data[buffCounter++] = sn + smin;
               }
            }
         }
      }
      /*Copy the result into an array.*/
      {
         int i, j, k = 0;
         int NL = buffCounter / 3;
         out = fMallocHandle(3, NL);
         for(i = 0; i < NL; i++) {
            for(j = 0; j < 3; j++) {
               out->data[(j) * out->width + (i)] = buffer->data[k];
               k++;
            }
         }
      }
      free(buffer);
   }
   
   return out;
}
