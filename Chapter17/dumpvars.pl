#!/usr/bin/perl
# dumpvars.pl (p621-622)
use strict;
use warnings;

use Dumpvalue;

my $dumper = new Dumpvalue(compactDump => 1, globPrint => 1);

# dump out '@INC', '%INC', and '%ENV':
$dumper->dumpvars('main', 'INC', 'ENV');
# dump out everything else
$dumper->dumpvars('main', '!(INC|ENV)');
# dump out anything that ends in a digit: handy after a regexp!
$dumper->dumpvars('main', '~\d$');
