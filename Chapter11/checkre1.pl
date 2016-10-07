#!/usr/bin/perl
# checkre1.pl (p384)
use warnings;
use strict;

while (<>) {
    chomp;
    eval {qr/$_/;};
    print $@?"Error in '$_': $@\n": "'$_' is legal \n";
}
