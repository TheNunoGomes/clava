/********************************
Author: Sravanthi Kota Venkata
********************************/

#include "sdvbs_common.h"

F2D* imageBlur(I2D* imageIn)
{
    int rows, cols;
    F2D *imageOut, *tempOut;
    float temp;
    int k, endCol, endRow, i, j;

    rows = imageIn->height;
    cols = imageIn->width;

    //imageOut = fSetArray(rows, cols, 0);
    //tempOut = fSetArray(rows, cols, 0);
    
    imageOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * imageOut->width + (0)] = 0;
	imageOut->data[(i) * imageOut->width + (1)] = 0;
	imageOut->data[(i) * imageOut->width + (cols-2)] = 0;
	imageOut->data[(i) * imageOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * imageOut->width + (j)] = 0;
	imageOut->data[(1) * imageOut->width + (j)] = 0;
	imageOut->data[(rows-2) * imageOut->width + (j)] = 0;
	imageOut->data[(rows-1) * imageOut->width + (j)] = 0;
    }  
      
    tempOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	tempOut->data[(i) * tempOut->width + (0)] = 0;
	tempOut->data[(i) * tempOut->width + (1)] = 0;
	tempOut->data[(i) * tempOut->width + (cols-2)] = 0;
	tempOut->data[(i) * tempOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	tempOut->data[(0) * tempOut->width + (j)] = 0;
	tempOut->data[(1) * tempOut->width + (j)] = 0;
	tempOut->data[(rows-2) * tempOut->width + (j)] = 0;
	tempOut->data[(rows-1) * tempOut->width + (j)] = 0;
    }

    endCol = cols - 2;
    endRow = rows - 2;  
    
    float b0, b1, b2, b3, b4;
    for(i=2; i<endRow; i++)
    {
    	b0 = subsref(imageIn,i,0);
    	b1 = subsref(imageIn,i,1);
    	b2 = subsref(imageIn,i,2);
    	b3 = subsref(imageIn,i,3);
        for(j=2; j<endCol; j++)
        {
            b4 = subsref(imageIn,i,j+2);
            
            temp = b0;
            temp += b1 * 4;
            temp += b2 * 6;
            temp += b3 * 4;
            temp += b4;
            
            b0 = b1;
            b1 = b2;
            b2 = b3;
            b3 = b4;
            
            subsref(tempOut,i,j) = temp*0.0625f;
        }
    }
    
    for(i=2; i<endRow; i++)
    {
        for(j=2; j<endCol; j++)
        {
            temp = subsref(tempOut,(i-2),j);
            temp += subsref(tempOut,(i-1),j) * 4;
            temp += subsref(tempOut,(i),j) * 6;
            temp += subsref(tempOut,(i+1),j) * 4;
            temp += subsref(tempOut,(i+2),j);

            subsref(imageOut,i,j) = temp*0.0625f;
        }
    }

    fFreeHandle(tempOut);
    return imageOut;
}
             

