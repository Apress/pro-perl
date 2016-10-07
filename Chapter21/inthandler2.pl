#!/usr/bin/perl
# inthandler2.pl (p858-859)
use warnings;
use strict;

{
    # define counter as closure variable
    my $interrupted = 0;

    sub handler {
        foreach ($interrupted) {
            $_ == 0 and warn("Once..."), $interrupted++, last;
            $_ == 1 and warn("Twice..."), $interrupted++, last;
            $_ == 2 and die ("Thrice!");
        }
    }
}

# register handler for SIGINT $SIG{INT} = \&handler;
$SIG{INT} = \&handler;

# kill time
while (1) { sleep 1; }
