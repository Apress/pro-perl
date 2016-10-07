#!/usr/bin/perl
# splitval1.pl (p517)
use warnings;
use strict;

use Getopt::Long;

our @file;   # same name as option, 'use vars @file' if Perl < 5.6

sub parsevalue {
    # allow symbolic references within this sub only
    no strict 'refs';

    my ($option, $value) = @_;
    push @$option, split(',', $value);
}

GetOptions("file=s" => \&parsevalue);

print scalar(@file)," files entered\n";

foreach (@file) {
    print "\t$_\n";
}
