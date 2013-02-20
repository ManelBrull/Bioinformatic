#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#	Lab sesion: 4
#	Exercise: 1
#
###########################################################


#This question is based on the last slide from the lecture on 2013-02-12.

#Write a Perl program that reads a set of aligned RNA sequences from a file
# specified on the command line and finds positions that are covarying to 
#maintain Watson-Crick complementarity. You can assume that there is one sequence
# per line, and that the sequences contain only the characters a, c, g and u (no 
#white space, gaps or ambiguity codes).

#You can test your program with multiple alignment files 'ma1' and 'ma2' in directory
# /chalmers/users/kemp/MVE360/practical4.

#(Hint: One approach is to work with an array whose elements are the sequences that
# you have read in from the file. An alternative approach is to construct an array
# whose elements are the columns in the alignment. This second approach requires a
# little more work at the start, but the main task - checking for covariance - is 
#then much easier. I don't mind which approach you take, but I recommend the second
# approach, since I believe it's less work overall.)

#Example of ma file input:
#gccuucgggc
#gacuucgguc
#ggcuucggcc

#buscar parejas que cambien
#en caso de cambiar la letra, la otra debe ser siempre su complementario. 
#Sacar el par adecuado

#MI idea es tener un array de strings

$nameFile = $ARGV[0];
open(SOURCE, $nameFile) || die "cannot open given file $!";

$dataFile = "";
$numLines = 0;
$length = 1;

while ( $line = <SOURCE> ) {
    chomp($line);
    $length = length($line);
    $dataFile .= $line;
    $numLines += 1;
}

#This is here just to make sure every data we retrieve is correct.
#print "$dataFile\n";
#print "$numLines\n";
#print "$length\n";
#It is needed beacuse we are going to simulate a matrix
#Arrays of string is the answer

@document = ();


for($col = 0; $col < $length; $col++) {
    $tseq = "";
    for($row = 0; $row < $numLines; $row++) {
        $preElement = &matrixNumber($row, $col, $length);
        $dataFile =~ /(.{$preElement})(.)(.*)/;
        print "$2\n";
    }
}


sub matrixNumber{
    #Input: fila, columna, longitud
    #Output: Number of the position
    $row = shift;
    $col = shift;
    $length = shift;
    return($row*$length + $col);
}




