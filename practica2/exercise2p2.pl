#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#
#	Exercise: 2 part2
#   
##########################################################

#Copy your solution for part (a) and modify it so that 
#it uses a "for" loop instead of a "while" loop.

#Copy your solution for part (b) and modify it so that it
#counts down from a number given as a command line argument.

#        unix> ./countdown_c.pl 3
#        3...
#        2...
#        1...
#        BOOM!
#        unix>

$countdown = $ARGV[0];

while ( $countdown != 0 ) {
    print "$countdown...\n";
    sleep 1;
    --$countdown;
}

print "KABOOM!!\n"

