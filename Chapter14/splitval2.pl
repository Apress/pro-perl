#!/usr/bin/perl
# splitval2.pl (p517-518)
use warnings;
use strict;

use Getopt::Long;

my @file;   # lexical, no longer needs to be the same name

sub parsevalue {
    my ($option, $value) = @_;
    return split(',', $value);
}

GetOptions("file=s" => sub {push @file, parsevalue(@_)});
