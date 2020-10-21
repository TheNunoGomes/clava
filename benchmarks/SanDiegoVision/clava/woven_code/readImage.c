#include <stdio.h>
#include <stdlib.h>
#include "sdvbs_common.h"
/********************************
Author: Sravanthi Kota Venkata
********************************/
I2D * readImage(char const *pathName) {
   // Reading BMP image
   char signature[2];
   int file_size;
   short reserved1;
   short reserved2;
   int loc_of_bitmap;
   int size_of_infoheader;
   int width;
   int height;
   short number_of_planes;
   short bits_per_pixel;
   int compression_method;
   int bytes_of_bitmap;
   int hori_reso;
   int vert_reso;
   int no_of_colors;
   int no_of_imp_colors;
   int nI, nJ;
   int pixSize;
   unsigned char tempb;
   unsigned char tempg;
   unsigned char tempr;
   unsigned char tempjunk[12];
   int ta;
   I2D *srcImage;
   FILE *input;
   input = fopen(pathName, "rb");
   if(input == ((void *) 0)) {
      perror("File pointer error");
      
      return ((void *) 0);
   }
   else {
      //start of header information
      fread(&signature, sizeof((signature)), 1, input);
      fread(&file_size, sizeof((file_size)), 1, input);
      fread(&reserved1, sizeof((reserved1)), 1, input);
      fread(&reserved2, sizeof((reserved2)), 1, input);
      fread(&loc_of_bitmap, sizeof((loc_of_bitmap)), 1, input);
      fread(&size_of_infoheader, sizeof((size_of_infoheader)), 1, input);
      fread(&width, sizeof((width)), 1, input); // Reads the width of the image
      fread(&height, sizeof((height)), 1, input); // Reads the height of the image
      fread(&number_of_planes, sizeof((number_of_planes)), 1, input);
      fread(&bits_per_pixel, sizeof((bits_per_pixel)), 1, input);
      fread(&compression_method, sizeof((compression_method)), 1, input);
      fread(&bytes_of_bitmap, sizeof((bytes_of_bitmap)), 1, input);
      fread(&hori_reso, sizeof((hori_reso)), 1, input);
      fread(&vert_reso, sizeof((vert_reso)), 1, input);
      fread(&no_of_colors, sizeof((no_of_colors)), 1, input);
      fread(&no_of_imp_colors, sizeof((no_of_imp_colors)), 1, input);
      //end of header information
      srcImage = iMallocHandle(height, width);
      // Conditions to check whether the BMP is interleaved and handling few exceptions
      if(srcImage->height <= 0 || srcImage->width <= 0 || signature[0] != 'B' || signature[1] != 'M' || (bits_per_pixel != 24 && bits_per_pixel != 8)) {
         
         return ((void *) 0);
      }
      fseek(input, loc_of_bitmap, 0);
      if(bits_per_pixel == 8) {
         for(nI = (height - 1); nI >= 0; nI--) {
            for(nJ = 0; nJ < width; nJ++) {
               fread(&tempg, sizeof(unsigned char), 1, input);
               srcImage->data[(nI) * srcImage->width + (nJ)] = (int) tempg;
            }
         }
      }
      else if(bits_per_pixel == 24) {
         for(nI = (height - 1); nI >= 0; nI--) {
            for(nJ = 0; nJ < width; nJ++) {
               fread(&tempb, sizeof(unsigned char), 1, input);
               fread(&tempg, sizeof(unsigned char), 1, input);
               fread(&tempr, sizeof(unsigned char), 1, input);
               ta = (3 * tempr + 6 * tempg + tempb) / 10;
               ta = tempg;
               srcImage->data[(nI) * srcImage->width + (nJ)] = (int) ta;
            }
         }
      }
      else {
         
         return ((void *) 0);
      }
      fclose(input);
      
      return srcImage;
   }
}
