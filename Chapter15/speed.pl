#!/usr/bin/perl
# speed.pl (p559)
use warnings;
use strict;

use POSIX;
use Term::Cap;

# set the line speed explicitly - but 'POSIX::B9600' may not be defined
my $termcap1 = Term::Cap->Tgetent({
    TERM => undef,
    OSPEED => POSIX::B9600
});

# interrogate the terminal for the line speed, no need for a constant
my $termios = new POSIX::Termios;
$termios->getattr(fileno(STDOUT));
my $termcap2 = Term::Cap->Tgetent({
    TERM => undef,
    OSPEED => $termios->getospeed
});

# extended example
$termcap2->Tputs('cl', 1, *STDOUT);
$termcap2->Tgoto('cm', 3, 5, *STDOUT);
$termcap2->Tputs('md', 1, *STDOUT);
print "Bold Text";
