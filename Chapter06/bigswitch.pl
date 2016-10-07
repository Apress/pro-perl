#!/usr/bin/perl
# bigswitch.pl (p183)
use strict;
use warnings;
use Switch;

my $perl = "Perl";
my %hash = ( "pErl" => 2, "peRl" => 3 );
my $cref = sub { $_[0] eq "pERl" };
sub testcase { $_[0] eq "peRL" };
my @array = (2..4);

my @values=qw[
    1 perl Perl 3 6 pErl PerL pERL pERl peRL PERL php
];

foreach my $input (@values) {
    switch ($input) {
        case 1                     { print "1 literal number" }
        case "perl"                { print "2 literal string" }
        case ($perl)               { print "3 string variable" }
        case (\@array)             { print "4 array variable reference" }
        case [5..9]                { print "5 literal array reference" }
        case (%hash)               { print "6 hash key" }
        case { "PerL" => "Value" } { print "7 hash reference key" }
        case { $_[0] eq "pERL" }   { print "8 anonymous sub" }
        case ($cref)               { print "9 code reference (anonymous)" }
        case (\&testcase)          { print "A code reference (named)" }
        case /^perl/i              { print "B regular expression" }
        else                       { print "C not known at this address" }
    }
    print "\n";
}
