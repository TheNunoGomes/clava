/********************************
Author: Sravanthi Kota Venkata
v3: Inline fSetArray
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

F2D* calcSobel_dY_540x960(F2D* imageIn)
{
    int rows = 540, cols = 960;
    int kernel_1[3] = { 1, 0, -1 }, kernel_2[3] = { 1, 2, 1 };
	float temp;
    int endCol, endRow, i, j;
    int k, outputRows, outputCols;
    F2D *imageOut, *tempOut;
    
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

F2D* calcSobel_dY_1080x1920(F2D* imageIn)
{
    int rows = 1080, cols = 1920;
    int kernel_1[3] = { 1, 0, -1 }, kernel_2[3] = { 1, 2, 1 };
	float temp;
    int endCol, endRow, i, j;
    int k, outputRows, outputCols;
    F2D *imageOut, *tempOut;
    
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
