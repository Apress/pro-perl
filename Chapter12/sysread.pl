#!/usr/bin/perl
# sysread.pl (p436-437)
use warnings;
use strict;

use POSIX;

my $result;

die "Usage: $0 file \n" unless @ARGV;
sysopen HANDLE, $ARGV[0], O_RDONLY|O_NONBLOCK;
# read 20 chrs into $result
my $chrs = sysread HANDLE, $result, 20;
if ($chrs == 20) {
    # got all 20, try to read another 30 chrs into $result after the first 20
    $chrs += sysread HANDLE, $result, 30, 20;
    print "Got '$result' \n";
    if ($chrs < 50) {
        print "Data source exhausted after $chrs characters \n";
    } else {
        print "Read $chrs characters \n";
    }
} elsif ($chrs > 0) {
    print "Got '$result' \n";
    print "Data source exhausted after $chrs characters \n";
} else {
    print "No data! \n";
}
