#!/usr/bin/perl
# iscyrillicblock.pl (p976)
use strict;
use warnings;
use charnames qw(:short);

sub IsCyrillicBlock {
return <<_END_;
0400 04FF
0500 0520
1D2B
_END_
}

my $string="\N{Cyrillic:Psi}";

print "IsCyrillicBlock\n" if $string=~/\p{IsCyrillicBlock}/;
