#!/usr/bin/perl
# charinfo.pl (p966)
use strict;
use warnings;
use Unicode::UCD qw(charinfo);

die "Usage: $0 <code value|U+NNNN> ... \n"
    unless @ARGV;

foreach my $char (@ARGV) {
    my $info=eval { charinfo($char) };

    if ($info) {
        print "Character code U+",(delete $info->{code}),":\n";
        print map {
            $info->{$_} ? sprintf "%13s = %s\n", $_, $info->{$_} : ()
        } sort keys %$info;
    } else {
        print "$char : *Invalid code*\n";
    }
}

