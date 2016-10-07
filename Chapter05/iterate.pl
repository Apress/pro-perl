#!/usr/bin/perl
# iterate.pl (p126)
use strict;
use warnings;

my %hash = ('Key1' => 'Value1', 'Key2' => 'Value2');
# dump of hash
print "$_ => $hash{$_} \n" foreach keys %hash;

# print list of sorted values
foreach (sort values %hash) {
    print "Value: $_ \n";
}
