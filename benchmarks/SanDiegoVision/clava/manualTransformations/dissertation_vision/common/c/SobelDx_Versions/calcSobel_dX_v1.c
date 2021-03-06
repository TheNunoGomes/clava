/********************************
Author: Sravanthi Kota Venkata
v2: Data Reuse
********************************/

#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"

F2D* calcSobel_dX(F2D* imageIn)
{
    int rows, cols;
    float temp;
    int endCol, endRow, i, j;
    int k;
    F2D *imageOut, *tempOut;

    rows = imageIn->height;
    cols = imageIn->width;
    
    imageOut = fSetArray(rows, cols, 0);
    tempOut = fSetArray(rows, cols, 0);
   
    endCol = cols - 1;

    endRow = rows - 1;

    float b0, b1, b2;
    
    for(i=1; i<endRow; i++)
    {
    	b0 = subsref(imageIn,(i),0);
    	b1 = subsref(imageIn,(i),1);
        for(j=1; j<endCol; j++)
        {
            b2 = subsref(imageIn,(i),j+1);
            
            temp = b0;
            temp -= b2;
            
            b0 = b1;
            b1 = b2;
            
            subsref(tempOut,i,j) = temp*0.5f;
        }
    }
    
    for(i=1; i<endRow; i++)
    {
        for(j=1; j<endCol; j++) // Vectorized O3/Ofast
        {
            temp = subsref(tempOut,(i-1),j);
            temp += subsref(tempOut,(i),j) * 2;
            temp += subsref(tempOut,(i+1),j);
            subsref(imageOut,i,j) = temp*0.25f;
        }
    }

    fFreeHandle(tempOut);
    return imageOut;
    
}

