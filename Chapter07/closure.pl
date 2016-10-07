#!/usr/bin/perl
# closure.pl (p239)
use warnings;
use strict;

sub make_counter ($) {
    my $count = @_?shift:0;

    return sub {
        $count = $_[0] if @_;
        return $count++;
    }
}

my $counter = make_counter(0);
foreach (1..10) {
    print &$counter, "\n";
}
print "\n";   # displays 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

$counter->(1000);   #reset the counter
foreach (1..3) {
    print &$counter, "\n";
}
print "\n";   # displays 1000, 1001, 1002
