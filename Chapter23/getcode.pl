#!/usr/bin/perl
# getcode.pl (p962-963)
use strict;
use warnings;
use charnames ':full';

die "Usage: $0 <name>\n" unless @ARGV;
my $name=uc(join ' ',@ARGV);

my $code=charnames::vianame($name);
if ($code) {
    printf "%6d = %04X : %s\n", $code, $code, $name;
} else {
    print "  $name is *Invalid*\n";
}
