#!/usr/bin/perl
# foreach1.pl (p43)
use warnings;

@array = ("one", "two", "three");
foreach $iterator (@array) {
    print "The value of the iterator is now $iterator \n";
}
