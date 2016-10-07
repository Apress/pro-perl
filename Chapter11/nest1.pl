#!/usr/bin/perl
# nest1.pl (p358)
use warnings;
use strict;

my $text = "one, two, three, four";

# iterate over matches with foreach and $_
foreach ($text =~ /\b(\w+)\b/g) {
    print "outer: got: $_, matched: $&, extracted: $1 \n";
    foreach (/(\w)/g) {
        print "\tinner: got: $_, matched $&, extracted $1 \n";
    }
}
