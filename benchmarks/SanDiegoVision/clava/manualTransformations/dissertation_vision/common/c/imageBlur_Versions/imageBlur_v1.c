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

    imageOut = fSetArray(rows, cols, 0);
    tempOut = fSetArray(rows, cols, 0);

    endCol = cols - 2;
    endRow = rows - 2;  

    for(i=2; i<endRow; i++)
    {
        for(j=2; j<endCol; j++)
        {
            temp = subsref(imageIn,i,j-2);
            temp += subsref(imageIn,i,j-1) * 4;
            temp += subsref(imageIn,i,j) * 6;
            temp += subsref(imageIn,i,j+1) * 4;
            temp += subsref(imageIn,i,j+2);
            
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
             

