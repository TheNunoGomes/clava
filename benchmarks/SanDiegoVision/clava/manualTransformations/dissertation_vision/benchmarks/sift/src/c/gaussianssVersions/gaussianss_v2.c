/********************************
Author: Sravanthi Kota Venkata
********************************/

#include "sift.h"

F2D* resizeArray(F2D* array, int omin) 
{
	F2D* prev = NULL;
	F2D* current = array;
	int o;
    if(omin<0)
    {
        for(o=1; o>=-omin; o--)
        {
			prev = current;
            current = doubleSize(current);
			fFreeHandle(prev);
        }
    }
    if(omin>0)
    {
        for(o=1; o<= omin; o++)
		{
			prev = current;
            current = halveSize(current);
			fFreeHandle(prev);
		}
    }
	return current;
}

/**
    Returns the Gaussian scale space of image I. Image I is assumed to be
    pre-smoothed at level SIGMAN. O,S,OMIN,SMIN,SMAX,SIGMA0 are the
    parameters of the scale space.
**/

    F2D** gaussianss(F2D* array, float sigman, int O, int S, int omin, int smin, int smax, float sigma0)
    {
        float k, dsigma0, dsigma;
        int s, i, j, o, so, M, N, sbest;
        int intervals = smax-smin+1;
        float temp, target_sigma, prev_sigma;
        F2D *TMP, **gss;
        F2D* I = array;

        // Scale multiplicative step
        k = pow(2, (1.0f/S));
        dsigma0 = sigma0 * sqrt(1-(1.0f/pow(k,2)));  // Scale step factor
        
        // If omin < 0, multiply the size of the image.
        I = resizeArray(I, omin);
        M = I->height;
        N = I->width;
        so = -smin+1;       // Index offset

        gss = malloc(O*intervals*sizeof(F2D*));
        if(gss == NULL)
        {
            printf("Could not allocate memory\n");
            return NULL;
        }

        temp = sqrt(pow((sigma0*pow(k,smin)),2) - pow((sigman/pow(2,omin)),2));

        {
            gss[0] = fSetArray(I->height, I->width, 0);
            imsmooth2160(I, temp, gss[0] );
        }

        for(s=smin; s<smax; s++)
        {
            dsigma = pow(k,s+1) * dsigma0;
            gss[s+so] = fSetArray(gss[s+so-1]->height, gss[s+so-1]->width, 0);
            imsmooth2160( gss[(s+so-1)] , dsigma, gss[(s+so)] );
        }     
        
        /** Other octaves **/
        
        for(o=1; o<O; o++)
        { 
            sbest = MIN(smin+S-1, smax-1);
            TMP = halveSize( gss[(o-1)*intervals+sbest+so]);
            target_sigma = sigma0 * pow(k,smin);
            prev_sigma = sigma0 * pow(k, (sbest+1)-S);

            temp = sqrt(pow(target_sigma,2) - pow(prev_sigma, 2));
            if(target_sigma > prev_sigma)
            {
                gss[o*intervals] = fSetArray(TMP->height, TMP->width, 0);
                imsmooth(TMP, temp, gss[o*intervals] );
            }
            else
            {
                int i;
                gss[o*intervals] = fSetArray(TMP->height, TMP->width, 0);
                for(i=0; i<(TMP->height*TMP->width); i++)
                    asubsref(gss[o*intervals],i) = asubsref(TMP,i);
            }

            M = TMP->height;
            N = TMP->width;

            fFreeHandle(TMP);

            for(s=smin; s<smax; s++)
            {
                dsigma = pow(k,s+1) * dsigma0;
                gss[o*intervals+s+so] = fSetArray(gss[o*intervals+s-1+so]->height, gss[o*intervals+s-1+so]->width, 0);
                if(gss[o*intervals+s-1+so]->height == gss[o*intervals+s-1+so]->width) {
		    switch(gss[o*intervals+s-1+so]->height) {
		    	case 2160:
                		imsmooth2160( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
		    	case 1080:
                		imsmooth1080( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
		    	case 540:
                		imsmooth540( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
		    	case 270:
                		imsmooth270( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
	    		case 135:
                		imsmooth135( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
		    	case 68:
                		imsmooth68( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
	    		case 34:
                		imsmooth34( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
		    	default:
                		imsmooth( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
		    		break;
		    }
		}
		else
			imsmooth( gss[o*intervals+s-1+so] , dsigma, gss[o*intervals+s+so]);
            }    
        }

        fFreeHandle(I);
        return gss;
    }
