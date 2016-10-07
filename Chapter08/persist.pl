#!/usr/bin/perl
# persist.pl (p252)
use warnings;
use strict;

sub definelexical {
    my $lexvar = "the original value";
    return \$lexvar;   # return reference to variable
}

sub printlexicalref {
    my $lexvar = ${$_[0]};   # dereference the reference
    print "The variable still contains $lexvar \n";
}

my $ref = definelexical();
printlexicalref($ref);
