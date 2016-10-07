#!/usr/bin/perl
# mflag.pl (p363)
# (use file 'mflagfile' as input for this program)
use warnings;
use strict;

# put <> into slurp mode
undef $/;
# read configuration file supplied on command line into string
my $configuration = <>;

my %config;
# read all configuration options from config string
while ($configuration =~ /^\s*(\w+)\s* = \s*(.+?)\s*$/mg) {
    $config{$1} = $2;
}

print "Got: $_ => '$config{$_}'\n" foreach (sort keys %config);
