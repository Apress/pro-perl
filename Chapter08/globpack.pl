#!/usr/bin/perl
# globpack.pl (p246)
use warnings;
use strict;

sub define_global {
    use vars qw($package_variable); #scope NOT limited
    $package_variable = "defined in subroutine";
}

print $package_variable; # visible here but not yet defined
define_global;
print $package_variable; # visible here and now defined
