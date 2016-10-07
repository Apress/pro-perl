#!/usr/bin/perl
# join.pl (p224)
use warnings;

sub wrapjoin ($$$@) {
    my ($join, $left, $right, @strings) = @_;
    foreach (@strings) {
        $_ = $left. $_. $right;
    }
    return join $join, @strings;
}

print wrapjoin("\n", "[","]", "One", "Two", "Three");
