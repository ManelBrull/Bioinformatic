#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#	Lab sesion: 3
#	Exercise: 3
#   It seems that works. However I'm pretty sure if it's correct   
#
##########################################################

# Write a Perl program that reads a UniProt file and writes out the sequences of the alpha helices. There should be one line of output for #each alpha helix in the protein. The name of the UniProt file should be given as an argument on the command line. The positions of alpha #helices are indicated in a UniProt file on lines that begin with "FT   HELIX".

$name_file = $ARGV[0];

open(SOURCE, $name_file) || die "cannot open given file $!";

$seqHelix = ""; # all the sequences for helix go here
@initial = (); #initial number of the sequence
@length = (); #length of each sequence
#substr($seq1, $initial[1], $length[1]); example of the desired usage


$seq1 = "";
while ( <SOURCE> ) {
	chomp;
    if ( /(FT +HELIX) +(\d+) +(\d+)/ ) {
        push(@initial, $2-1);
        $res = $3 - $2;
        push(@length, $res+1);
    }
	if ( /^     / ) {
		s/ //g;
		$seq1 .= $_;
	}
}
close SWISSPROT_FILE;

$length = $#initial;

for($i = 0; $i < $length+1; $i++) {
    $s = substr($seq1, $initial[$i], $length[$i]);
    print "$s\n";
}























