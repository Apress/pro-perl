#!/usr/bin/perl
# configenv.pl (p529)
use warnings;
use strict;

use Env qw($PATH @PATH);

my $sep = $Config::Config{'path_sep'};
# add current directory if not already present
unless ($PATH =~ /(^|$sep)\.($sep|$)/) {
    push @PATH, '.';
}

print $PATH,"\n";
