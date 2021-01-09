/********************************
Author: Sravanthi Kota Venkata
v3: Inline fSetArray
********************************/

#include "sdvbs_common.h"

F2D* calcSobel_dY(F2D* imageIn)
{
    int rows, cols;
	float temp;
    int endCol, endRow, i, j;
    F2D *imageOut, *tempOut;

    rows = imageIn->height;
    cols = imageIn->width;
    
    // level 1 is the base image.

    
    //imageOut = fSetArray(rows, cols, 0);
    //tempOut = fSetArray(rows, cols, 0);
    
    imageOut = fMallocHandle(rows, cols);
    tempOut = fMallocHandle(rows, cols);

    // VECTORIZADO
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * cols + (0)] = 0;
	imageOut->data[(i) * cols + (cols-1)] = 0;
	
	tempOut->data[(i) * cols + (0)] = 0;
	tempOut->data[(i) * cols + (cols-1)] = 0;
    }
    // VECTORIZADO
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * cols + (j)] = 0;
	imageOut->data[(rows-1) * cols + (j)] = 0;
	
	tempOut->data[(0) * cols + (j)] = 0;
	tempOut->data[(rows-1) * cols + (j)] = 0;
    }  
     
    endCol = cols - 1; 
    endRow = rows - 1; 
    
    for(i=1; i<endRow; i++)
    {
    	// VECTORIZADO
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
	float temp;
    int endCol, endRow, i, j;
    F2D *imageOut, *tempOut;
    
    imageOut = fMallocHandle(rows, cols);
    tempOut = fMallocHandle(rows, cols);
    
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * cols + (0)] = 0;
	imageOut->data[(i) * cols + (cols-1)] = 0;
	
	tempOut->data[(i) * cols + (0)] = 0;
	tempOut->data[(i) * cols + (cols-1)] = 0;
    }
    // VECTORIZADO
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * cols + (j)] = 0;
	imageOut->data[(rows-1) * cols + (j)] = 0;
	
	tempOut->data[(0) * cols + (j)] = 0;
	tempOut->data[(rows-1) * cols + (j)] = 0;
    } 
     
    endCol = cols - 1; 
    endRow = rows - 1; 
    
    for(i=1; i<endRow; i++)
    {
        // VECTORIZADO
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
	float temp;
    int endCol, endRow, i, j;
    F2D *imageOut, *tempOut;
    
    imageOut = fMallocHandle(rows, cols);
    tempOut = fMallocHandle(rows, cols);
    
    for(i=0; i<rows; i++) {
	imageOut->data[(i) * cols + (0)] = 0;
	imageOut->data[(i) * cols + (cols-1)] = 0;
	
	tempOut->data[(i) * cols + (0)] = 0;
	tempOut->data[(i) * cols + (cols-1)] = 0;
    }
    // VECTORIZADO
    for(j=0; j<cols; j++) {
	imageOut->data[(0) * cols + (j)] = 0;
	imageOut->data[(rows-1) * cols + (j)] = 0;
	
	tempOut->data[(0) * cols + (j)] = 0;
	tempOut->data[(rows-1) * cols + (j)] = 0;
    }  

    endCol = cols - 1; 
    endRow = rows - 1; 
    
    for(i=1; i<endRow; i++)
    {
<<<<<<< HEAD
    	// VECTORIZADO
    	for(j=1; j<endCol; j++)
        {
            temp = subsref(imageIn,(i-1),j);
            temp -= subsref(imageIn,(i+1),j);
            
            subsref(tempOut,i,j) = temp*0.5f;
=======
    	// VECTORIZED AND UNROLLED
        for(j=startCol; j<endCol; j++)
        {
            temp = 0;
            // UNROLLED
            for(k=-halfKernel; k<=halfKernel; k++)
            {
                temp += subsref(imageIn,(i+k),j) * asubsref(kernel_1,k+halfKernel);
            }
            subsref(tempOut,i,j) = temp/kernelSum_1;
>>>>>>> master
        }
    }

    float b0, b1, b2;
    
    for(i=1; i<endRow; i++)
    {
<<<<<<< HEAD
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
=======
    	// VECTORIZED AND UNROLLED
        for(j=startCol; j<endCol; j++)
        {
            temp = 0;
            // UNROLLED
            for(k=-halfKernel; k<=halfKernel; k++)
            {
                temp += subsref(tempOut,i,j+k) * asubsref(kernel_2,k+halfKernel);
            }
            subsref(imageOut,i,j) = temp/(float)kernelSum_2;
>>>>>>> master
        }
    }

    fFreeHandle(tempOut);
    return imageOut;
    
}
