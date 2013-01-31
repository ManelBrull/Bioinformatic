/*
 * To compile this C program, placing the executable file in 'global', type:
 *
 *      gcc -o global global_alignment.c
 *
 * To run the program, type:
 *
 *      ./global
 */

#include <stdio.h>

#define MAX_LENGTH	100

#define MATCH_SCORE	2
#define MISMATCH_SCORE	-1
#define GAP_PENALTY	2

#define STOP		0
#define UP		1
#define LEFT		2
#define DIAG		3


main()
{ 
	int	i, j;
	int	m, n;
	int	alignmentLength, score, tmp;
	char	X[MAX_LENGTH+1] = "PAWHEAE";
	char	Y[MAX_LENGTH+1] = "HDAGAWGHEQ";

	int	F[MAX_LENGTH+1][MAX_LENGTH+1];		/* score matrix */
	int	trace[MAX_LENGTH+1][MAX_LENGTH+1];	/* trace matrix */
	char	alignX[MAX_LENGTH*2];		/* aligned X sequence */
	char	alignY[MAX_LENGTH*2];		/* aligned Y sequence */


	/*
	 * Find lengths of (null-terminated) strings X and Y
	 */
	m = 0;
	n = 0;
	while ( X[m] != 0 ) {
		m++;
	}
	while ( Y[n] != 0 ) {
		n++;
	}


	/*
	 * Initialise matrices
	 */

	F[0][0] = 0;
	trace[0][0] = STOP;
	for ( i=1 ; i<=m ; i++ ) {
		F[i][0] = 0;
		trace[i][0] = STOP;
	}
	for ( j=1 ; j<=n ; j++ ) {
		F[0][j] = 0;
		trace[0][j] = STOP;
	}


 	/*
	 * Fill matrices
	 */

	int maxi = 0;
	int maxj = 0;
	int max = 0;

	for ( i=1 ; i<=m ; i++ ) {

		for ( j=1 ; j<=n ; j++ ) {
	
			if ( X[i-1]==Y[j-1] ) {
				score = F[i-1][j-1] + MATCH_SCORE;
			} else {
				score = F[i-1][j-1] + MISMATCH_SCORE;
			}
			if (score < 0) score = 0;
			if ( score == 0)
				trace[i][j] = STOP;			
			else
				trace[i][j] = DIAG;

			tmp = F[i-1][j] - GAP_PENALTY;
			
			if (tmp < 0 ) {
				tmp = 0;
			}
			if ( tmp>score ) {
				score = tmp;
				if(score == 0)
					trace[i][j] = STOP;
				else
					trace[i][j] = UP;
			}

			tmp = F[i][j-1] - GAP_PENALTY;
			if (tmp < 0 ) {
				tmp = 0;
			}
			if( tmp>score ) {
				score = tmp;
				if (score == 0)
					trace[i][j] = STOP;
				else
					trace[i][j] = LEFT;
			}

			F[i][j] = score;
			if(score > max) {
				maxi = i;
				maxj = j;
      				max = score;
			}
 		}
	}


	/*
	 * Print score matrix
	 */

	printf("Score matrix:\n      ");
	for ( j=0 ; j<n ; ++j ) {
		printf("%5c", Y[j]);
	}
	printf("\n");
	for ( i=0 ; i<=m ; i++ ) {
		if ( i==0 ) {
			printf(" ");
		} else {
			printf("%c", X[i-1]);
		}
		for ( j=0 ; j<=n ; j++ ) {
			printf("%5d", F[i][j]);
		}
		printf("\n");
	}
	printf("\n");


	/*
	 * Trace back from the lower-right corner of the matrix
	 */


	i = maxi;
	j = maxj;
	alignmentLength = 0;



	while ( trace[i][j] != STOP ) {

		switch ( trace[i][j] ) {

			case DIAG:
				alignX[alignmentLength] = X[i-1];
				alignY[alignmentLength] = Y[j-1];
				i--;
				j--;
				alignmentLength++;
				break;

			case LEFT:
				alignX[alignmentLength] = '-';
				alignY[alignmentLength] = Y[j-1];
				j--;
				alignmentLength++;
				break;

			case UP:
				alignX[alignmentLength] = X[i-1];
				alignY[alignmentLength] = '-';
				i--;
				alignmentLength++;
		}
	}
	
	
	/*
	 * Print trace matrix
	 */

	printf("Trace matrix:\n      ");
	for ( j=0 ; j<n ; ++j ) {
		printf("%5c", Y[j]);
	}
	printf("\n");
	for ( i=0 ; i<=m ; i++ ) {
		if ( i==0 ) {
			printf(" ");
		} else {
			printf("%c", X[i-1]);
		}
		for ( j=0 ; j<=n ; j++ ) {
			printf("%5d", trace[i][j]);
		}
		printf("\n");
	}
	printf("\n");


	/*
	 * Print alignment
	 */


	for ( i=alignmentLength-1 ; i>=0 ; i-- ) {
		printf("%c",alignX[i]);
	}
	printf("\n");


	for ( i=alignmentLength-1 ; i >= 0 ; i--) {
		if (alignX[i] == alignY[i]) {
			printf("|");
		} else {
			printf(" ");
		}
	}
	printf("\n");

	for ( i=alignmentLength-1 ; i>=0 ; i-- ) {
		printf("%c",alignY[i]);
	}
	printf("\n");


	/*
	* Calculate alignament
	*/
	int aligned = 0;
	for (i=alignmentLength-1 ; i >= 0 ; i--) {
		if (alignX[i] == alignY[i]) {
			aligned++;
		} 
	}

	// Length of the alignement

	float result = (double) aligned/(alignmentLength-1) * 100;
	printf("Sequence identity percent: %f", result);
	





















	return(1);
}
