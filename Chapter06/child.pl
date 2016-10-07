#!/usr/bin/perl
# child.pl (p167)
use warnings;
use strict;

my $text = "This is the child";
{
    my $text = "This is block scoped";
    print "$text \n";   # produces "This is block scoped";
}
print "$text \n";   # produces "This is the child";
