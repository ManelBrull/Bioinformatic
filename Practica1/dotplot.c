/*
 * To compile this C program, placing the executable file in 'dotplot', type:
 *
 *	gcc -o dotplot dotplot.c
 *
 * To run the program, type:
 *
 *	./dotplot
 */

#include <stdio.h>

#define MAX_LENGTH	100

int main()
{
	int	i, j;
	char	sequence1[MAX_LENGTH] = "DOROTHYHODGKIN";
	char	sequence2[MAX_LENGTH] = "DOROTHYCROWFOOTHODGKIN";
	int	length1;
	int	length2;

	/*
	 * Find lengths of (null-terminated) strings sequence1
	 * and sequence2.
	 */
	length1 = 0;
	length2 = 0;
	while ( sequence1[length1] != 0 ) {
		length1++;
	}
	while ( sequence2[length2] != 0 ) {
		length2++;
	}

	/*
	 * Print dotplot
	 */

	for ( i=0 ; i<length1 ; i++ ) {
		for ( j=0 ; j<length2 ; j++ ) {
			if ( sequence1[i] == sequence2[j] && sequence1[i+1] == sequence2[j+1]) {
				printf("%c", sequence1[i]);
			} else {
				printf(" ");
			}
		}
		printf("\n");
	}

	return(1);
}
