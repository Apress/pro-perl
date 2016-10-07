#!/usr/bin/perl
# message.pl (p873)
use warnings;
use strict;

pipe CREAD, PWRITE;   # parent->child
pipe PREAD, CWRITE;   # child->parent

my $message = "S";

if (fork) {
    # parent--close child end of pipes
    close CREAD;
    close CWRITE;

    syswrite PWRITE, "$message \n";
    while (<PREAD>) {
        chomp;
        print "Parent got $_ \n";
        syswrite PWRITE, "P$_ \n";
        sleep 1;
    }
} else {
    # child--close parent end of pipes
    close PREAD;
    close PWRITE;

    while (<CREAD>) {
        chomp;
        print "Child got $_ \n";
        syswrite CWRITE, "C$_ \n";
    }
}
