#!/usr/bin/perl
# listgroups.pl (p453)
use warnings;
use strict;

my @groups;
while (my $name = getgrent) {
    push @groups, $name;
}
print "Groups: @groups \n";
