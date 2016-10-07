#!/usr/bin/perl
# menu.pl (p544)
use warnings;
use strict;

use Term::ReadKey;

ReadMode 'cbreak';

print "Enter an option 1 to 9: ";
my $selection = 0;
do {
    $selection = int (ReadKey 0);
} until ($selection >= 1 and $selection <= 9);

print "You typed $selection\n";
ReadMode 'restore';
