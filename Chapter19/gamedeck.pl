#!/usr/bin/perl
# gamedeck.pl (p770-771)
use warnings;
use strict;

use Game::Deck;

# create a standard deck of playing cards
my $deck=new Game::Deck(
    ['Spades','Hearts','Diamonds','Clubs'],
    ['Ace',2..10,'Jack','Queen','King'],
);

# spread it out, shuffle it, and spread it out again
print "The unshuffled deck looks like this:\n";
$deck->print;
$deck->shuffle;
print "After shuffling it looks like this:\n";
$deck->print;

# peek at, deal, and replace a card
print "Now for some card cutting...\n";
print "\tTop card is ",$deck->card(0)->fullname,"\n";
my $card=$deck->deal_from_top(1);
print "\tDealt ",$card->fullname,"\n";
print "\tTop card is now ",$deck->card(0)->fullname,"\n";
$deck->replace_on_bottom($card);
print "\tReplaced ",$card->fullname," on bottom\n";
print "The deck now looks like this:\n";
$deck->print;

# deal a hand of cards - a hand is just a small deck
my $hand=new Game::Deck;
my @cards=$deck->deal_from_bottom(7);
$hand->replace_on_top(@cards);
print "Dealt seven cards from bottom and added to hand:\n";
$hand->print;
