/********************************
Author: Sravanthi Kota Venkata
********************************/

/** C File **/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <math.h>
#include "timingUtils.h"
#include "sdvbs_common.h"

#define baseline

#ifdef performance
    #include <time.h>
    //#define CPU 3600 //MHz
    void photonPrintTiming(unsigned int * elapsed)
    {
        if(elapsed[1] == 0) 
        {
            printf("Cycles elapsed\t\t- %u\n", elapsed[0]);
            printf("Time elapsed\t\t- %u microseconds\n\n", (elapsed[0]/CLOCKS_PER_SEC));
        }
        else
        {
            char buffer[20];
            printf("Cycles elapsed\t\t- %u%u\n", elapsed[1], elapsed[0]);
            sprintf(buffer, "%u%u", elapsed[1], elapsed[0]);
            printf("Time elapsed (seconds)\t\t- %lu\n\n", atol(buffer)/CLOCKS_PER_SEC);
        }
    } 
#endif
#ifdef baseline
    void photonPrintTiming(unsigned int * elapsed)
    {
        if(elapsed[1] == 0)
            printf("Cycles elapsed\t\t- %u\n\n", elapsed[0]);
        else
            printf("Cycles elapsed\t\t- %u%u\n\n", elapsed[1], elapsed[0]);
    }
#endif
/** End of C Code **/
