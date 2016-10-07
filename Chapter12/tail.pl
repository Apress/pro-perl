#!/usr/bin/perl
# tail.pl (p418)
use strict;
use warnings;

die "Give me a file\n" unless @ARGV and -f $ARGV[0];
open LOGFILE, $ARGV[0];

while (1) {
    # read lines while there are lines to read
    print "$.: $_" while <LOGFILE>;

    # got an 'eof' - sleep, reset 'eof', then loop back and try again
    sleep(1);
    seek LOGFILE, 0, 1;
}
