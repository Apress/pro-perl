#!/usr/bin/perl
# statonce.pl (p457)
use warnings;
use strict;

print "Enter filename to test: ";
my $filename = <>;
chomp $filename;

if (lstat $filename) {
    print "$filename is a file \n" if -f _;
    print "$filename is a directory \n" if -d _;
    print "$filename is a link \n" if -l _;

    print "$filename is readable \n" if -r _;
    print "$filename is writable \n" if -w _;
    print "$filename is executable \n" if -x _;
} else {
    print "$filename does not exist \n";
}

