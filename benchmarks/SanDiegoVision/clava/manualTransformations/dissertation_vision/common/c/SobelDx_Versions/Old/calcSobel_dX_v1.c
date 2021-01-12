/********************************
Author: Sravanthi Kota Venkata
v1: Loop Unrolling
********************************/

#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"

F2D* calcSobel_dX(F2D* imageIn)
{
    int rows, cols;
    int kernel_1[3] = { 1, 2, 1 }, kernel_2[3] = { 1, 0, -1 };
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

    for(i=1; i<endRow; i++)
    {
        for(j=1; j<endCol; j++)
        {
            temp = subsref(imageIn,i,j-1) * kernel_2[0];
            temp += subsref(imageIn,i,j) * kernel_2[1];
            temp += subsref(imageIn,i,j+1) * kernel_2[2];
            subsref(tempOut,i,j) = temp*0.5f;
        }
    }
    
    for(i=1; i<endRow; i++)
    {
        for(j=1; j<endCol; j++)
        {
            temp = subsref(tempOut,(i-1),j) * kernel_1[0];
            temp += subsref(tempOut,(i),j) * kernel_1[1];
            temp += subsref(tempOut,(i+1),j) * kernel_1[2];
            subsref(imageOut,i,j) = temp*0.25f;
        }
    }

    fFreeHandle(tempOut);
    return imageOut;
    
}

