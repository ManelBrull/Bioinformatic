#!/usr/bin/perl

###########################################################
#	Author: Manel Brull Piqué
#
#	Exercise: 2 part1
#   
##########################################################

#This question refers to the program countdown.pl from the
#lecture.

#Copy the program countdown.pl and modify it so that it
#counts down from a number entered by the user in response
#to a prompt, e.g.

#        unix> ./countdown_a.pl
#        Type in a number: 3
#        3...
#        2...
#        1...
#        BOOM!
#        unix>

print "insert countdown: ";
$countdown = <STDIN>;
print"\n";
chomp($countdown);
while ( $countdown != 0 ) {
    print "$countdown...\n";
    sleep 1;
    --$countdown;
}

print "KABOOM!!\n"
