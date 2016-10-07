#!/usr/bin/perl
# scope.pl (p48)

our $scalar = "global";
print "\$scalar is a $scalar variable\n";
{
      my $scalar = "lexical";
      print "\$scalar is now a $scalar variable\n";
}
print "\$scalar is a $scalar variable again\n";
