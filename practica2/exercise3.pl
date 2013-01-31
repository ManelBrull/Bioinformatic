#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#
#	Exercise: 3
#   
##########################################################

#In an alanine scan experiment, each residue in a peptide is mutated to alanine (one letter code 'A') 
#in turn, and the resulting peptides are tested to identify which of the original peptide's residues 
#are necessary for the peptide's biological function.

#For example, in an alanine scan of the peptide with sequence LFEIFEIER, ten new peptides are constructed,
# and these have the following sequences:

#    AFEIFEIER
#    LAEIFEIER
#    LFAIFEIER
#    LFEAFEIER
#    LFEIAEIER
#    LFEIFAIER
#    LFEIFEAER
#    LFEIFEIAR
#    LFEIFEIEA

#Write a Perl program that writes out all of the peptide sequences that are constructed in an alanine scan 
#experiment of the original sequence that is in string $s (this could be the sequence "LFEIFEIER" as in the 
#example above, or it could be any other sequence, e.g. "DIPPPRPPKPHP").

print "Introduce sequence: ";
$seq = <STDIN>;
chomp($seq);

$l = length($seq);
for ( $i = 0; $i < $l; $i++ ) {
    $pre  = substr($seq, 0, $i);
    $mid  = A;
    $post = substr($seq, $i+1, $l);
    $show = $pre.$mid.$post;
    print "$show\n";
}























