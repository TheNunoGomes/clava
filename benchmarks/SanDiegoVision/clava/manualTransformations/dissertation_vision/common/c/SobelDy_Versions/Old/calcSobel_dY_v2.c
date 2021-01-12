/********************************
Author: Sravanthi Kota Venkata
********************************/

#include "sdvbs_common.h"

F2D* calcSobel_dY(F2D* imageIn)
{
    int rows, cols;
    int kernel_1[3] = { 1, 0, -1 }, kernel_2[3] = { 1, 2, 1 };
	float temp;
    int endCol, endRow, i, j;
    int k, outputRows, outputCols;
    F2D *imageOut, *tempOut;

    rows = imageIn->height;
    cols = imageIn->width;
    
    // level 1 is the base image.

    outputRows = rows; 
    outputCols = cols;

    imageOut = fSetArray(outputRows, outputCols, 0);
    tempOut = fSetArray(outputRows, outputCols, 0);

    endCol = cols - 1; 
    endRow = rows - 1; 
    
    for(i=1; i<endRow; i++)
    {
    
        for(j=1; j<endCol; j++)
        {
            temp = subsref(imageIn,(i-1),j);
            temp -= subsref(imageIn,(i+1),j);
            
            subsref(tempOut,i,j) = temp*0.5f;
        }
    }

    float b0, b1, b2;
    
    for(i=1; i<endRow; i++)
    {
    	b0 = subsref(tempOut,i,0);
    	b1 = subsref(tempOut,i,1);
        for(j=1; j<endCol; j++)
        {
            b2 = subsref(tempOut,i,j+1);
            
            temp = b0;
            temp += b1 * 2;
            temp += b2;
            
            b0 = b1;
            b1 = b2;

            subsref(imageOut,i,j) = temp*0.25f;
        }
    }

    fFreeHandle(tempOut);
    return imageOut;
    
}
