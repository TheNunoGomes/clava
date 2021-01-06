/********************************
Author: Sravanthi Kota Venkata
********************************/

#include <stdio.h>
#include <stdlib.h>
#include "disparity.h"

void finalSAD(F2D *__restrict__ integralImg, int win_sz, F2D *__restrict__ retSAD)
{
    int endR, endC;
    int i, j, k;
    
    endR = 1920;
    endC = 1080;
    //printf("%dx%d\n", endR, endC);
    //printf("%d\n", win_sz);
    
    float tl0, tl1, tl2, tl3, tl4, tl5, tl6, tl7;
    float tr0, tr1, tr2, tr3, tr4, tr5, tr6, tr7;
    float bl0, bl1, bl2, bl3, bl4, bl5, bl6, bl7;
    float br0, br1, br2, br3, br4, br5, br6, br7;
    int count = 0, total = 0;
    
    for(j=0; j<endC; j++)
    {
    	br0 = subsref(integralImg, 8, j+8);
    	tl0 = subsref(integralImg, 1, j+1);
    	tr0 = subsref(integralImg, 1, j+8);
    	bl0 = subsref(integralImg, 8, j+1);    	
    	
    	br1 = subsref(integralImg, 9, j+8);
    	tl1 = subsref(integralImg, 2, j+1);
    	tr1 = subsref(integralImg, 2, j+8);
    	bl1 = subsref(integralImg, 9, j+1);
    	
    	br2 = subsref(integralImg, 10, j+8);
    	tl2 = subsref(integralImg, 3, j+1);
    	tr2 = subsref(integralImg, 3, j+8);
    	bl2 = subsref(integralImg, 10, j+1);
    
    	br3 = subsref(integralImg, 11, j+8);
    	tl3 = subsref(integralImg, 4, j+1);
    	tr3 = subsref(integralImg, 4, j+8);
    	bl3 = subsref(integralImg, 11, j+1);
    	
    	br4 = subsref(integralImg, 12, j+8);
    	tl4 = subsref(integralImg, 5, j+1);
    	tr4 = subsref(integralImg, 5, j+8);
    	bl4 = subsref(integralImg, 12, j+1);
    	
    	br5 = subsref(integralImg, 13, j+8);
    	tl5 = subsref(integralImg, 6, j+1);
    	tr5 = subsref(integralImg, 6, j+8);
    	bl5 = subsref(integralImg, 13, j+1);
    	
    	br6 = subsref(integralImg, 14, j+8);
    	tl6 = subsref(integralImg, 7, j+1);
    	tr6 = subsref(integralImg, 7, j+8);
    	bl6 = subsref(integralImg, 14, j+1);
    	
    	
    	subsref(retSAD, 0, j) = br0 + tl0 - tr0 - bl0;
    	subsref(retSAD, 1, j) = br1 + tl1 - tr1 - bl1;
    	subsref(retSAD, 2, j) = br2 + tl2 - tr2 - bl2;
    	subsref(retSAD, 3, j) = br3 + tl3 - tr3 - bl3;
    	subsref(retSAD, 4, j) = br4 + tl4 - tr4 - bl4;
    	subsref(retSAD, 5, j) = br5 + tl5 - tr5 - bl5;
    	subsref(retSAD, 6, j) = br6 + tl6 - tr6 - bl6;
            
        for(i=7; i<endR; i++)
        {
            br7 = subsref(integralImg, i+8, j+8);
            tl7 = subsref(integralImg, i+1, j+1);
            tr7 = subsref(integralImg, i+1, j+8);
            bl7 = subsref(integralImg, i+8, j+1);
            
            //*
    	    if(tl7 != bl0) {
		printf("right: %f / %f\n", tr7, br0);
		//printf("left: %f / %f\n", tl7, bl0);
    		count++;
    	    }
    	    if(tr7 != br0) {
		//printf("right: %f / %f\n", tr7, br0);
		printf("left: %f / %f\n", tl7, bl0);
    		count++;
    	    }
            //*/
            subsref(retSAD,i,j) = br7 + tl7 - tr7 - bl7;
            
            
            br0 = br1;
            tl0 = tl1;
            tr0 = tr1;
            bl0 = bl1;
            
            br1 = br2;
            tl1 = tl2;
            tr1 = tr2;
            bl1 = bl2;
            
            br2 = br3;
            tl2 = tl3;
            tr2 = tr3;
            bl2 = bl3;
            
            br3 = br4;
            tl3 = tl4;
            tr3 = tr4;
            bl3 = bl4;
            
            br4 = br5;
            tl4 = tl5;
            tr4 = tr5;
            bl4 = bl5;
            
            br5 = br6;
            tl5 = tl6;
            tr5 = tr6;
            bl5 = bl6;
            
            br6 = br7;
            tl6 = tl7;
            tr6 = tr7;
            bl6 = bl7;
        }
    }
    return;
}

