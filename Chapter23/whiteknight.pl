#!/usr/bin/perl
# whiteknight.pl (p961)
use charnames ":full";

# interpolate Unicode character into string
my $chess_move = "White moves \N{WHITE CHESS KNIGHT}";
print "Length of move: ",length($chess_move),"\n";

# match UTF-8 string against UTF-8 pattern
print "Check!\n" if $chess_move =~ /\N{WHITE CHESS KNIGHT}/;
