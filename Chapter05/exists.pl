#!/usr/bin/perl
# exists.pl (p158)
use strict;
use warnings;

my %hash = ('Key1' => 'Value1', 'Key2' => 'Value2');
my $key = 'Key1';

# the first if tests for the presence of the key 'Key1'
# the second if checks whether the key 'Key1' is defined
if (exists $hash{$key}) {
    if (defined $hash{$key}) {
        print "$key exists and is defined as $hash{$key} \n";
    } else {
        print "$key exists but is not defined \n";
    }
} else {
    print "$key does not exist\n";
}
