#!/usr/bin/perl
# substr.pl (p350)
use warnings;
use strict;

my $text = "One Two Three 456 Seven Eight 910 Eleven Twelve";
$text =~ /[0-9]+/;
while ($text =~ /[0-9]+/g) {
    my $prefix = substr($text,0,$-[0]);   # equals $`
    my $match = substr($text,$-[0],$+[0]-$-[0]);   # equals $&
    my $suffix = substr($text,$+[0]);   # equals $'
    print " \$match = $match \n \$prefix = $prefix \n \$suffix = $suffix \n";
}
