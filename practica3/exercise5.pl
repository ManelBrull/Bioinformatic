#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#	Lab sesion: 3
#	Exercise: 5
#
##########################################################

#Modify the program reverse_complement.pl so that it can print the
# reverse complement of DNA sequences that contain nucleotide ambiguity
# codes ("Nomenclature for Incompletely Specified Bases in Nucleic Acid
# Sequences", Tables 1 and 2). 

$dna = "ATGAATBKMSTVWCB";
print "Original sequence:   ", $dna, "\n";

#
# Make the complement sequence:
#	change A to T
#	change C to G
#	change G to C
#	change T to A
#B	C	D	G	H	K	M	S	T	V	W	N
#V	G	H	C	D	M	K	S*	A	B	W*	N*

#Complement	

$dna =~ tr/ABCDGHKMSTVWN/TVGHCDMKSABWN/;
print "Complement sequence: ", $dna, "\n";

#
# Make the reverse complement sequence.
#

$dna = reverse($dna);
print "Reverse complement:  ", $dna, "\n";
























