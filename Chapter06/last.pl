#!/usr/bin/perl
# last.pl (p194)
use warnings;

my @array = ("One", "Two", "Three", undef, "Five", "Six");

#copy array up to the first undefined element
my @newarray = ();
foreach my $element (@array) {
    last unless defined ($element);
    push @newarray, $element;
}

foreach (@newarray) {
    print $_." \n";   # prints One, Two, Three
}
