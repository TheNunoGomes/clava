/********************************
Author: Sravanthi Kota Venkata
v3: Inline fSetArray and Specialized Matrix Size
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
    
    //imageOut = fSetArray(rows, cols, 0);
    //tempOut = fSetArray(rows, cols, 0);
    
    imageOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * imageOut->width + (0)] = 0;
	imageOut->data[(i) * imageOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * imageOut->width + (j)] = 0;
	imageOut->data[(rows-1) * imageOut->width + (j)] = 0;
    }  
      
    tempOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	tempOut->data[(i) * tempOut->width + (0)] = 0;
	tempOut->data[(i) * tempOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	tempOut->data[(0) * tempOut->width + (j)] = 0;
	tempOut->data[(rows-1) * tempOut->width + (j)] = 0;
    }
    
    
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
        for(j=1; j<endCol; j++)
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

F2D* calcSobel_dX_540x960(F2D* imageIn)
{
    int rows = 540, cols = 960;
    float temp;
    int endCol, endRow, i, j;
    int k;
    F2D *imageOut, *tempOut;
    
    //imageOut = fSetArray(rows, cols, 0);
    //tempOut = fSetArray(rows, cols, 0);
    
    imageOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * imageOut->width + (0)] = 0;
	imageOut->data[(i) * imageOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * imageOut->width + (j)] = 0;
	imageOut->data[(rows-1) * imageOut->width + (j)] = 0;
    }  
      
    tempOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	tempOut->data[(i) * tempOut->width + (0)] = 0;
	tempOut->data[(i) * tempOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	tempOut->data[(0) * tempOut->width + (j)] = 0;
	tempOut->data[(rows-1) * tempOut->width + (j)] = 0;
    }
    
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
        for(j=1; j<endCol; j++)
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

F2D* calcSobel_dX_1080x1920(F2D* imageIn)
{
    int rows = 1080, cols = 1920;
    float temp;
    int endCol, endRow, i, j;
    int k;
    F2D *imageOut, *tempOut;

    //imageOut = fSetArray(rows, cols, 0);
    //tempOut = fSetArray(rows, cols, 0);
    
    imageOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * imageOut->width + (0)] = 0;
	imageOut->data[(i) * imageOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * imageOut->width + (j)] = 0;
	imageOut->data[(rows-1) * imageOut->width + (j)] = 0;
    }  
      
    tempOut = fMallocHandle(rows, cols);
    for(i=0; i<rows; i++) {
	tempOut->data[(i) * tempOut->width + (0)] = 0;
	tempOut->data[(i) * tempOut->width + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	tempOut->data[(0) * tempOut->width + (j)] = 0;
	tempOut->data[(rows-1) * tempOut->width + (j)] = 0;
    }
    
    
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
        for(j=1; j<endCol; j++)
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

