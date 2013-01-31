#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#
#	Exercise: 4
#   
##########################################################


#Rewrite the dotplot program from Practical 1 in Perl.

$sequence1 = "DOROTHYHODGKIN";
$sequence2 = "DOROTHYCROWFOOTHODGKIN";


# Find lengths of (null-terminated) strings sequence1 and sequence2

$length1 = length($sequence1);
$length2 = length($sequence2);

#print dotplot
for ( $i=0 ; $i<$length1 ; $i++ ) {
    $elei = substr($sequence1, $i, 1);
    $elei2 = substr($sequence1, $i+1, 1);
    for ( $j=0 ; $j<$length2 ; $j++ ) {
        $elej = substr($sequence2, $j, 1);
        $elej2 = substr($sequence2, $j+1, 1);
    	if (( $elei eq $elej ) and ( $elei2 eq $elej2 )) { 
            print "$elei";
    	} else {
            print " ";
	    }
    }
    print "\n";
}





















