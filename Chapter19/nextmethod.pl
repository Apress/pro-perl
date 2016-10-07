#!/usr/bin/perl
# nextmethod.pl (p765)
use strict;
use warnings;
use NEXT;

{
    package First::Parent;
    sub new { print __PACKAGE__,"\n"; shift->NEXT::new(@_); };

    package Second::Parent;
    sub new { print __PACKAGE__,"\n"; return bless {},__PACKAGE__ };
}

package Child;
our @ISA=qw(First::Parent Second::Parent);

my $obj=new Child;
