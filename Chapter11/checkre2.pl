#!/usr/bin/perl
# checkre2.pl (p384-385)
use warnings;
use strict;

while (<>) {
    chomp;
    if (my $re = compile_re($_)) {
        print "Pattern ok: $re \n";
    } else {
        print "Illegal pattern: $@ \n";
    }
}

sub compile_re {
    my $pattern = shift;

    my $re;   # local package variable
    eval { $re = qr/$pattern/; };

    return $re; #undef on error
}

