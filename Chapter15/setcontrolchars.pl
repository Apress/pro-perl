#!/usr/bin/perl
# setcontrolchars.pl (p550-551)
use warnings;
use strict;

use Term::ReadKey;
my %oldcontrolchars = GetControlChars;

sub dump_list {
    my %controlchars = GetControlChars;
    foreach my $key (sort keys %controlchars) {
        print "$key\t => ",ord($controlchars{$key}),"\n";
    }
    print "\n";
}

dump_list;

# disable interrupt, suspend and erase (delete)
# change eof to whatever suspend is (i.e., Ctrl-D to Ctrl-Z)
SetControlChars INTERRUPT => 0,
                EOF => $oldcontrolchars{SUSPEND},
                SUSPEND => 0,
                ERASE => 0;

dump_list;

# reset control characters to their old values
SetControlChars %oldcontrolchars;

dump_list;
