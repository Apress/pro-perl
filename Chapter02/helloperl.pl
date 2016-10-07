#!/usr/bin/perl
# helloperl.pl (p31)
use strict;
use warnings;

sub hello {
    my ($argument)=@_;
    # the traditional salutation
    print "Hello $argument World!\n";
}

$ARGV[0] = "Brave New" unless scalar(@ARGV)>0;

hello($ARGV[0]);
