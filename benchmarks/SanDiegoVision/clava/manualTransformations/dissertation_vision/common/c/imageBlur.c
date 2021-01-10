/********************************
Author: Sravanthi Kota Venkata
v3: Inline fSetArray and Specialized Matrix Size
********************************/

#include "sdvbs_common.h"

F2D* imageBlur(I2D* imageIn)
{
    int rows, cols;
    F2D *imageOut, *tempOut;
    float temp;
    int endCol, endRow, i, j;

    rows = imageIn->height;
    cols = imageIn->width;

    imageOut = fMallocHandle(rows, cols);
    tempOut = fMallocHandle(rows, cols);

    // VECTORIZADO
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * cols + (0)] = 0;
	imageOut->data[(i) * cols + (1)] = 0;
	imageOut->data[(i) * cols + (cols-2)] = 0;
	imageOut->data[(i) * cols + (cols-1)] = 0;
	
	tempOut->data[(i) * cols + (0)] = 0;
	tempOut->data[(i) * cols + (1)] = 0;
	tempOut->data[(i) * cols + (cols-2)] = 0;
	tempOut->data[(i) * cols + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * cols + (j)] = 0;
	imageOut->data[(1) * cols + (j)] = 0;
	imageOut->data[(rows-2) * cols + (j)] = 0;
	imageOut->data[(rows-1) * cols + (j)] = 0;
	
	tempOut->data[(0) * cols + (j)] = 0;
	tempOut->data[(1) * cols + (j)] = 0;
	tempOut->data[(rows-2) * cols + (j)] = 0;
	tempOut->data[(rows-1) * cols + (j)] = 0;
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
    	// VECTORIZADO
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
             
F2D* imageBlur_1080x1920(I2D* imageIn)
{
    int rows = 1080, cols = 1920;
    F2D *imageOut, *tempOut;
    float temp;
    int k, endCol, endRow, i, j;

    imageOut = fMallocHandle(rows, cols);
    tempOut = fMallocHandle(rows, cols);

    // VECTORIZADO
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * cols + (0)] = 0;
	imageOut->data[(i) * cols + (1)] = 0;
	imageOut->data[(i) * cols + (cols-2)] = 0;
	imageOut->data[(i) * cols + (cols-1)] = 0;
	
	tempOut->data[(i) * cols + (0)] = 0;
	tempOut->data[(i) * cols + (1)] = 0;
	tempOut->data[(i) * cols + (cols-2)] = 0;
	tempOut->data[(i) * cols + (cols-1)] = 0;
    }
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * cols + (j)] = 0;
	imageOut->data[(1) * cols+ (j)] = 0;
	imageOut->data[(rows-2) * cols + (j)] = 0;
	imageOut->data[(rows-1) * cols + (j)] = 0;
	
	tempOut->data[(0) * cols + (j)] = 0;
	tempOut->data[(1) * cols + (j)] = 0;
	tempOut->data[(rows-2) * cols + (j)] = 0;
	tempOut->data[(rows-1) * cols + (j)] = 0;
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
    	// VECTORIZADO
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
             

