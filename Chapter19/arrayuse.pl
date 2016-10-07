#!/usr/bin/perl
# arrayuse.pl (p726)
use warnings;
use strict;

use Game::ArrayCard;

my $card = new Game::ArrayCard('Ace', 'Spades');

print $card->[NAME];   # produces 'Ace'

__END__

$card->[SUIT] = 'Hearts';   # change card to the Ace of Hearts
print " of ", $card->[SUIT];   # produces ' of Hearts'
