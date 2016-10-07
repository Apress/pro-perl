#!/usr/bin/perl
# constants.pl (p563)
use warnings;
use strict;

use Term::ANSIColor qw(:constants);

print RED, ON_WHITE, "This is Red on White", RESET;

# extended example
my $banner = BLUE.ON_RED.UNDERSCORE."Hello World".RESET;
print $banner,"\n";

# automatically append reset code
$Term::ANSIColor::AUTORESET = 1;

# look, no commas!
print RED ON_WHITE "This is Red on White";
