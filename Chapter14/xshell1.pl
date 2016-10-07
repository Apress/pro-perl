#!/usr/bin/perl
# xshell1.pl (p533-534)
use warnings;
use strict;

use Shell;

my $dir = (@ARGV)?$ARGV[0]:".";
my @files = split "\n",ls(-1);

foreach (@files) {
    print "File $_ ";

    if (/~$/) {
        # delete files ending in ~
        rm($_);
        print "deleted";
    } else {
        # rename to lowercase
        my $newname = lc $_;
        if ($newname ne $_) {
            mv($_,lc $_);
            print "renamed $newname";
        } else {
            print "ok";
        }
    }
    print "\n";
}
