#!/usr/bin/perl
# filesizefld.pl (p463)
use warnings;
use strict;

use File::stat qw(:FIELDS);

print "Enter filename: ";
my $filename = <>;
chomp($filename);
if (stat $filename) {
    print "'$filename' is ", $st_size,
          " bytes and occupies ", $st_blksize * $st_blocks,
          " bytes of disc space \n";
} else {
    print "Cannot stat $filename: $| \n";
}
