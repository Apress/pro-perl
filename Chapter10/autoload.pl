#!/usr/bin/perl
# autoload.pl (p287)
use warnings;
use strict;

sub AUTOLOAD {
    our $AUTOLOAD;   # "use vars '$AUTOLOAD'" for Perl < 5.6
    $" = ',';
    print "You called '$AUTOLOAD(@_)'\n";
}

fee('fie','foe','fum');
testing(1,2,3);
