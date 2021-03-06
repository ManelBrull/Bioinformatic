#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#	Lab sesion: 3
#	Exercise: 4
#
##########################################################


#Study the program /chalmers/users/kemp/MVE360/lecture4/translate.pl

#Generalise this program so that it prints the translations of a DNA sequence in all six possible reading frames (sequence as read in, in #three phases; reverse complement, in three phases).

%standardgeneticcode = (
 "ttt"=> "Phe",   "tct"=> "Ser", "tat"=> "Tyr",   "tgt"=> "Cys",
 "ttc"=> "Phe",   "tcc"=> "Ser", "tac"=> "Tyr",   "tgc"=> "Cys",
 "tta"=> "Leu",   "tca"=> "Ser", "taa"=> "TER",   "tga"=> "TER",
 "ttg"=> "Leu",   "tcg"=> "Ser", "tag"=> "TER",   "tgg"=> "Trp",
 "ctt"=> "Leu",   "cct"=> "Pro", "cat"=> "His",   "cgt"=> "Arg",
 "ctc"=> "Leu",   "ccc"=> "Pro", "cac"=> "His",   "cgc"=> "Arg",
 "cta"=> "Leu",   "cca"=> "Pro", "caa"=> "Gln",   "cga"=> "Arg",
 "ctg"=> "Leu",   "ccg"=> "Pro", "cag"=> "Gln",   "cgg"=> "Arg",
 "att"=> "Ile",   "act"=> "Thr", "aat"=> "Asn",   "agt"=> "Ser",
 "atc"=> "Ile",   "acc"=> "Thr", "aac"=> "Asn",   "agc"=> "Ser",
 "ata"=> "Ile",   "aca"=> "Thr", "aaa"=> "Lys",   "aga"=> "Arg",
 "atg"=> "Met",   "acg"=> "Thr", "aag"=> "Lys",   "agg"=> "Arg",
 "gtt"=> "Val",   "gct"=> "Ala", "gat"=> "Asp",   "ggt"=> "Gly",
 "gtc"=> "Val",   "gcc"=> "Ala", "gac"=> "Asp",   "ggc"=> "Gly",
 "gta"=> "Val",   "gca"=> "Ala", "gaa"=> "Glu",   "gga"=> "Gly",
 "gtg"=> "Val",   "gcg"=> "Ala", "gag"=> "Glu",   "ggg"=> "Gly"
);


#   process input data


while ($nline = <DATA>) {

    #Normal version
    print $nline;
    chomp($nline);
    $line = $nline;    
    $line =~ s/(...)/\1 /g;
    @triplets = split(" ", $line);
    foreach $codon (@triplets) {
        print "$standardgeneticcode{$codon}";
    }
    print "\n\n";
    
    $line = $nline;
    $line =~ /(.)(.+)/;
    $line = $2;
    print "$line\n";
    $line =~ s/(...)/\1 /g;
    @triplets = split(" ", $line);
    foreach $codon (@triplets) {
        print "$standardgeneticcode{$codon}";
    }
    print "\n\n";

    $line = $nline;
    $line =~ /(.)(.)(.+)/;
    $line = $3;
    print "$line\n";
    $line =~ s/(...)/\1 /g;
    @triplets = split(" ", $line);
    foreach $codon (@triplets) {
        print "$standardgeneticcode{$codon}";
    }
    print "\n\n";

    #Reversed version, the same just changing some stuff

    $nlinerev = scalar reverse($nline);
    $nlinerev =~ tr/gatc/ctag/;    
    
    print $nlinerev;
    print "\n";
    chomp($nlinerev);
    $line = $nlinerev;    
    $line =~ s/(...)/\1 /g;
    @triplets = split(" ", $line);
    foreach $codon (@triplets) {
        print "$standardgeneticcode{$codon}";
    }
    print "\n\n";
    
    $line = $nlinerev;
    $line =~ /(.)(.+)/;
    $line = $2;
    print "$line\n";
    $line =~ s/(...)/\1 /g;
    @triplets = split(" ", $line);
    foreach $codon (@triplets) {
        print "$standardgeneticcode{$codon}";
    }
    print "\n\n";

    $line = $nlinerev;
    $line =~ /(.)(.)(.+)/;
    $line = $3;
    print "$line\n";
    $line =~ s/(...)/\1 /g;
    @triplets = split(" ", $line);
    foreach $codon (@triplets) {
        print "$standardgeneticcode{$codon}";
    }
    print "\n\n";
}


#   what follows is input data


__END__
atgcatccctttaat
tctgtctga
