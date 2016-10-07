#!/usr/bin/perl
# greely.pl (p367)
use warnings;
use strict;

my $company = 'Greely Greely & Spatz';
my $match = $company;   #set to longest possible match

while ($company =~ /(Greely)(?=(.*?Spatz))/g) {
    my $got = $1.$2;   #assemble match from both parts
    $match = $got if length($got) < length($match);
}

print "Shortest possible match is '$match' \n";
