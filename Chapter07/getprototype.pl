#!/usr/bin/perl
# getprototype.pl (p229)
use strict;
use warnings;

sub add_two ($$) {
    return $_[0]+$_[1];
}

print prototype(\&add_two),"\n"; # produces '$$'
print prototype('add_two'),"\n"; # likewise
