#!/usr/bin/perl
# srandcall.pl (p208)
use warnings;
use strict;
use subs qw(srand);

sub srand {
    if ($] >= 5.004 and not @_) {
        warn "Unqualified call to srand redundant in Perl $]";
    } else {
        # call the real srand via the CORE package
        CORE::srand @_;
    }
}
