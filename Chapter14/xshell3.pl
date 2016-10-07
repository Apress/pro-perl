#!/usr/bin/perl
# xshell3.pl (p536)
use warnings;
use strict;

use ExtUtils::Command ();   # empty list - no import

# programmatic wrappers for ExtUtils::Command subroutines
sub mv   { local @ARGV = @_;ExtUtils::Command::mv();   }
sub cp   { local @ARGV = @_;ExtUtils::Command::cp();   }
sub rm_f { local @ARGV = @_;ExtUtils::Command::rm_f(); }

my $dir = (@ARGV)?$ARGV[0]:".";
my @files = <$dir/*>;

foreach (@files) {
    print "File $_ ";
    if (/~$/) {
        # delete files ending in ~
        rm_f $_;
        print "deleted";
    } else {
        # rename to lowercase
        my $newname = lc $_;
        if ($newname ne $_) {
            mv $_,lc($_);
            print "renamed $newname";
        } else {
            print "ok";
        }
    }
    print "\n";
}
