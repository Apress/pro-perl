#!/usr/bin/perl
# nest2.pl (p359)
use warnings;
use strict;

my $text = "one, two, three, four";

# iterate over matches with foreach and $_
while ($text =~ /\b(\w+)\b/g) {
    print "outer: matched: $&, extracted: $1 \n";
    while ($1 =~ /(\w)/g) {
        print "\tinner: matched $&, extracted $1 \n";
    }
}
