#!/usr/bin/perl
# reverse.pl (p125)
use strict;
use warnings;

my %hash = ('Key1' => 'Value1', 'Key2' => 'Value2');
print "$hash{Key1}\n"; # print 'Value1'
foreach (keys %hash) {
    # invert key-value pair
    $hash{$hash{$_}} = $_;

    # remove original key
    delete $hash{$_};
}
print "$hash{Value1}\n"; # print 'Key1'
