#!/usr/bin/perl
# everydestructor.pl (p784)
use strict;
use warnings;

{
    package Ancestor;
    use NEXT;
    sub new     { return bless {}, ref($_[0]) || $_[0]; }
    sub DESTROY { print "We'll all"; shift->EVERY::destroy(); }
    sub destroy { print " we go\n"; }

    package Parent;
    our @ISA=qw(Ancestor);
    sub destroy { print " when"; }

    package Child;
    our @ISA=qw(Parent);
    sub destroy { print " go together"; }
}

my $object=new Child;
