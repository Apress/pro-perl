#!/usr/bin/perl
# varproto.pl (p226)
use warnings;
use strict;

sub capitalize (\$) {
    ${$_[0]} = ucfirst (lc ${$_[0]});
}

my $country = "england";
capitalize $country;
print $country, "\n";      # Ok, produces 'England'
# capitalize "scotland";   # ERROR: compile-time syntax error!
