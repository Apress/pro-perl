#!/usr/bin/perl
# checklink.pl (p476)
use warnings;
use strict;

use File::Find;

my $count = 0;

sub check_link {
    if (-l && !-e) {
        $count++;
        print "\t$File::Find::name is broken \n";
    }
}

print "Scanning for broken links in ", join(', ', @ARGV), ":\n";
find(\&check_link, @ARGV);
print "$count broken links found \n";
