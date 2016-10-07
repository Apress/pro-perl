#!/usr/bin/perl
# shrinkoutspace.pl (p416)
use strict;
use warnings;

use lib '.';
use PerlIO::via::shrinkspace;

my $unspaced="";
open OUTPUT, ">:via(shrinkspace)", \$unspaced;
print OUTPUT "This  text  is   spaced    out";
close OUTPUT;
print $unspaced." no longer\n";
