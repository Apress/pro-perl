# Simple/Filter/Replace.pm (p698)
# (this module is used by simplefilter.pl)
package Simple::Filter::Replace;
use strict;
use Carp qw(croak);
use Filter::Simple;

my ($replace,$with);

sub import {
    $replace = $_[1];
    unless ($replace) {
        croak("use ".__PACKAGE__." 'original' [, 'replacement'];");
    }
    $with = $_[2] || "";
}

FILTER { s/$replace/$with/g };

1;
