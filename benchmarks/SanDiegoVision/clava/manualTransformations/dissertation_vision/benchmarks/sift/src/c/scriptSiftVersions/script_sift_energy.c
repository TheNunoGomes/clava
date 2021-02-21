/********************************
Author: Sravanthi Kota Venkata
********************************/

#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include "sift.h"
#include "energymonitor_c.h"

#include <time.h>
#include <sys/resource.h>

void normalizeImage(F2D* image)
{
	int i;
	int rows;
	int cols;
    int tempMin = 10000, tempMax = -1;
	rows = image->height;
	cols = image->width;

    for(i=0; i<(rows*cols); i++)
        if(tempMin > asubsref(image,i))
            tempMin = asubsref(image,i);

    for(i=0; i<(rows*cols); i++)
        asubsref(image,i) = asubsref(image,i) - tempMin;

    for(i=0; i<(rows*cols); i++)
        if(tempMax < asubsref(image,i))
            tempMax = asubsref(image,i);

    for(i=0; i<(rows*cols); i++)
        asubsref(image,i) = ( asubsref(image,i) / (tempMax+0.0f) );
}

int main(int argc, char* argv[])
{
    double first, second;
	
	

    I2D* im;
    F2D *image;
    int rows, cols, i, j;
    F2D* frames;
    
    char imSrc[100];
    
    if(argc < 2)
    {
        printf("We need input image path\n");
        return -1;
    }

    sprintf(imSrc, "%s/1.bmp", argv[1]);

    im = readImage(imSrc);
    image = fiDeepCopy(im);
    iFreeHandle(im);
    rows = image->height;
    cols = image->width;

    
	struct timespec clava_timing_start_0, clava_timing_end_0;
	clock_gettime(CLOCK_MONOTONIC, &clava_timing_start_0);
    
	emonitor_t monitor = monitor_new(263808);
	
    /** Normalize the input image to lie between 0-1 **/
	normalizeImage(image);
    /** Extract sift features for the normalized image **/
    frames = sift(image);
    
    
    
	edata_t data = monitor_stop(monitor);

	clock_gettime(CLOCK_MONOTONIC, &clava_timing_end_0);
	double clava_timing_duration_0 = ((clava_timing_end_0.tv_sec + ((double) clava_timing_end_0.tv_nsec / 1000000000)) - (clava_timing_start_0.tv_sec + ((double) clava_timing_start_0.tv_nsec / 1000000000))) * (1000);
    printf("Clava Timer:\t\t%f ms\n", clava_timing_duration_0);


	printf("Samples:\t\t%d\n", data_get_samples(data));
	printf("Average CPU:\t\t%f\n", data_get_average_cpu(data));
	printf("Average GPU:\t\t%f\n", data_get_average_gpu(data));
	printf("Average MEM:\t\t%f\n", data_get_average_mem(data));
	printf("Energy time:\t\t%f ms\n", data_get_samples(data)*263808/1000);
	
#ifdef CHECK   
    {
        int ret=0;
        float tol = 0.2f;
#ifdef GENERATE_OUTPUT
        fWriteMatrix(frames, argv[1]);
#endif
        ret = fSelfCheck(frames, argv[1], tol);
        if (ret == -1)
            printf("Error in SIFT\n");
    }
#endif    

    fFreeHandle(frames);

    return 0;
}

