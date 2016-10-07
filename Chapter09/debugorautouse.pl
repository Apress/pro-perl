#!/usr/bin/perl -s -w
# debugorautouse.pl
use strict;
use vars '$debug';

use if $debug,             'File::Basename' => 'basename';
use if !$debug, autouse => 'File::Basename' => 'basename';

print "Before: ",join(",",keys %INC),"\n";
my $prog=basename($0);
print "After : ",join(",",keys %INC),"\n";
