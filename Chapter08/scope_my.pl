#!/usr/bin/perl
# scope-my.pl (p251)
use warnings;
use strict;

my $file_scope = "visible anywhere in the file";
print $file_scope, "\n";

sub topsub {
    my $top_scope = "visible in 'topsub'";
    if (1 > 0.5) {
        my $if_scope = "visible inside 'if'";
        # $file_scope, $top_scope, $if_scope ok here
        print "$file_scope, $top_scope, $if_scope \n";
    }

    bottomsub();
    # $file_scope, $top_scope ok here
    print "$file_scope, $top_scope\n";
}

sub bottomsub {
    my $bottom_scope = "visible in 'bottomsub'";
    # $file_scope, $bottom_scope ok here
    print "$file_scope, $bottom_scope \n";
}

topsub();

# only $file_scope ok here
print $file_scope, "\n";
