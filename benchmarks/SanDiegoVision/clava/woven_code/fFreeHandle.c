#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
void fFreeHandle(F2D *out) {
   if(out != ((void *) 0)) free(out);
   
   return;
}
