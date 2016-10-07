#!/usr/bin/perl
# blocks.pl (p282)
use warnings;
use strict;

$SIG{__DIE__} = sub {
    print "Et tu Brute?\n";
};

print "It's alive!\n";
die "Sudden death!\n";

BEGIN {
    print "BEGIN\n";
}

END {
    print "END\n";
}

INIT {
    print "INIT\n"
}

CHECK {
    print "CHECK\n"
}
