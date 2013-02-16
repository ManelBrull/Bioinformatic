#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#	Lab sesion: 3
#	Exercise: 2
#   It seems that works. However I'm pretty sure if it's correct   
#
##########################################################

# Write a Perl program that reads a UniProt file and stores the sequence as a string in variable '$sequence', and then writes out the sequence
#of the protein with one line per residue. Each line of output should contain the residue's one-letter code and the residue's position in the #sequence. The name of the UniProt file should be given as an argument on the command line.

#    Test your program with UniProt files P00784.uniprot (papaya proteinase I) and P00785.uniprot (kiwi fruit actinidin). These files are in
#directory /chalmers/users/kemp/MVE360/practical3/.

#        unix> ./sp_sequence.pl P00784.uniprot
#        M 1
#        A 2
#        M 3
#        ... etc.
#        unix>

$name_file = $ARGV[0];

open(SOURCE, $name_file) || die "cannot open given file $!";

$seq1 = "";
while ( <SOURCE> ) {
	chomp;
	if ( /^     / ) {
		s/ //g;
		$seq1 .= $_;
	}
}
close SWISSPROT_FILE;

for ( $i=0 ; $i<length($seq1) ; $i++ ) {
    $letter = substr($seq1, $i, 1);
    print "$letter $i\n";
}












































