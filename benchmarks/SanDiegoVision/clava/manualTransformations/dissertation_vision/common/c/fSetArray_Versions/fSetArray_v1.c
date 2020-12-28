/********************************
Author: Sravanthi Kota Venkata
********************************/

#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"

F2D* fSetArray(int rows, int cols, float val)
{
    int i, j;
    F2D *out;
    out = fMallocHandle(rows, cols);
    
    memset(out->data, val, 4);
    
    return out;
    
}
