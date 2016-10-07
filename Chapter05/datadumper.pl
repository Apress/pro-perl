#!/usr/bin/perl
# datadumper.pl (p152)
use warnings;

use Data::Dumper;

my $hashref = {a=>1, b=>2, h=>{c=>3, d=>4}, e=>[6, 7, 8]};

print Dumper($hashref);
