#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	
	int j, i, N = 10;
	int array[N][N];
	int W = 3;
	
	//Write the matrix
	for(i = 0; i < N; i++)
	{
		for(j = 0; j < N; j++)
			array[i][j] = 2;
	}

	#pragma clava data intervals: [\
	{\
		startValue: "0",\
		endValue: "W"\
	},\
	{\
		startValue: "W",\
		endValue: "N-W-1"\
	},\
	{\
		startValue: "N-W-1",\
		endValue: "N"\
	}\
	]
	//Actual loop
	for(i = 0 ; i < N ; ++i) 
	{	
		int start = i-W < 0 ? 0 : i-W;
		int end = i+W < N-1 ? i+W : N-1;
		for(j = start; j < end; j++)
			array[i][j] += array[i][j-1] + 2;
	}
	
	//Print Results
	for(i = 0; i < N; i++)
	{
		for(j = 0; j < N; j++)
			printf("Element [%d, %d] = %d", i, j, array[i][j]);
	}

	return 1;
}
