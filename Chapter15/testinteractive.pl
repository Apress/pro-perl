#!/usr/bin/perl
# testinteractive.pl (p540)
use strict;
use warnings;

# interactive - passes STDOUT
system "./checkinteractive.pl";

# not interactve -passes end of pipe
open PIPE,"./checkinteractive.pl |";
print <PIPE>;
close PIPE;
