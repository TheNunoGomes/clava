#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
int selfCheck(I2D *in1, char *path, int tol) {
   int r1, c1, ret = 1;
   FILE *fd;
   int count = 0;
   int *buffer;
   int i;
   int j;
   char file[100];
   int *data = in1->data;
   r1 = in1->height;
   c1 = in1->width;
   buffer = (int *) malloc(sizeof(int) * r1 * c1);
   sprintf(file, "%s/expected_C.txt", path);
   fd = fopen(file, "r");
   if(fd == ((void *) 0)) {
      
      return -1;
   }
   while(!feof(fd)) {
      fscanf(fd, "%d", &buffer[count]);
      count++;
   }
   count--;
   if(count < (r1 * c1)) {
      
      return -1;
   }
   for(i = 0; i < r1 * c1; i++) {
      if((abs(data[i]) - abs(buffer[i])) > tol || (abs(buffer[i]) - abs(data[i])) > tol) {
         
         return -1;
      }
   }
   fclose(fd);
   free(buffer);
   
   return ret;
}
