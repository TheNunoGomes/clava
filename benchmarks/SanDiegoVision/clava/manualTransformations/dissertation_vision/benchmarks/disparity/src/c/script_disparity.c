/********************************
Author: Sravanthi Kota Venkata
********************************/

#define _POSIX_C_SOURCE 199309L
#include <time.h>
#include <sys/resource.h>
#include <stdio.h>
#include <stdlib.h>
#include "disparity.h"

int main(int argc, char* argv[])
{
    int rows = 32;
    int cols = 32;
    I2D *imleft, *imright, *retDisparity;
    
    int i, j;
    char im1[100], im2[100], timFile[100];
    int WIN_SZ=8, SHIFT=64;
    FILE* fp;
    
    if(argc < 2)
    {
        printf("We need input image path and output path\n");
        return -1;
    }

    sprintf(im1, "%s/1.bmp", argv[1]);
    sprintf(im2, "%s/2.bmp", argv[1]);
    
    imleft = readImage(im1);
    imright = readImage(im2);

    rows = imleft->height;
    cols = imleft->width;

#ifdef test
    WIN_SZ = 2;
    SHIFT = 1;
#endif
#ifdef sim_fast
    WIN_SZ = 4;
    SHIFT = 4;
#endif
#ifdef sim
    WIN_SZ = 4;
    SHIFT = 8;
#endif

    
	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
	
	
	
    retDisparity = getDisparity(imleft, imright, WIN_SZ, SHIFT);
    
    
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
   printf("%fms\n", clava_timing_duration_0);


/*
    for(i = 0; i < rows; i++) {
    	for(j = 0; j < cols; j++) {
    	     printf("%d\t", retDisparity->data[i * retDisparity->width + j]);
    	}
    	printf("\n");
    }
   //*/
#ifdef CHECK   
    /** Self checking - use expected.txt from data directory  **/
    {
        int tol, ret=0;
        tol = 2;
#ifdef GENERATE_OUTPUT
        writeMatrix(retDisparity, argv[1]);
#endif
        ret = selfCheck(retDisparity, argv[1], tol);
        if (ret == -1)
            printf("Error in Disparity Map\n");
    }
    /** Self checking done **/
#endif
    
    iFreeHandle(imleft);
    iFreeHandle(imright);
    iFreeHandle(retDisparity);

    return 0;
}
