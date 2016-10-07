#!/usr/bin/perl
# repeat3.pl (p352-353)
use warnings;
use strict;

my $text = "one:two:three:four:five";
while ($text =~ /(([^:]+):?)/g) {
    print " \$1 = $1 \n \$2 = $2 \n";
}
