#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
void uiFreeHandle(UI2D *out) {
   free(out);
   
   return;
}
