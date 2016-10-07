#!/usr/bin/perl
# uninames.pl (p962)
use strict;
use warnings;
use charnames ':full';

die "Usage: $0 <start> <end>\n" unless @ARGV>=1;
my ($start,$end)=@ARGV;
$end=$start unless $end;

die "Bad range $start..$end\n"
    if ($start.$end)=~/\D/ or $end<$start;

for (my $code=$start; $code<=$end; $code++) {
    printf "%6d = U+%04x : %s\n", $code, $code,
      charnames::viacode($code) || '*Invalid*';
}
