#!/usr/bin/perl
# permhash.pl (p809)
use warnings;
use strict;

use Permission::Hash;

my %hash;
tie %hash, 'Permission::Hash', read => 1, write => 1, delete => 0;

$hash{one}   = 1;
$hash{two}   = 2;
$hash{three} = 3;

print "Try to delete a key... \n";
unless (eval {delete $hash{three}; 1} ) {
    print $@;
    print "Let's try again... \n";
    (tied %hash)->{delete} = 1;
    delete $hash {three};
    print "It worked! \n";
    (tied %hash)->{delete} = 0;
}

print "Disable writing... \n";
(tied %hash)->{write} = 0;
unless (eval {$hash{four} = 4; 1} ) {
    print $@;
}
(tied %hash)->{write} = 1;

print "Disable reading... \n";
(tied %hash)->{read} = 0;
unless (defined $hash{one}) {
    print $@;
}
(tied %hash)->{read} = 1;
