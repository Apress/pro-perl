#!/usr/bin/perl
# indexhash.pl (p127-128)
use warnings;
use strict;

# create a hash with integrated index
my %hash = (
    Mouse => { Index => 0, Value => 'Jerry'},
    Cat =>   { Index => 1, Value => 'Tom'},
    Dog =>   { Index => 2, Value => 'Spike'}
);

# sort a hash by integrated index
foreach (sort { $hash{$a} {'Index'} cmp $hash{$b}{'Index'} } keys %hash) {
    print "$hash{$_}{Value} <= $_ \n";
}
