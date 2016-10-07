#!/usr/bin/perl
# backseat.pl (p867)
use warnings;
use strict;

if (my $pid = fork) {
    print "Backseat daemon started with ID $pid \n";
    sleep 1;    # give child time to leave group
    kill 9,-$$; # parent suicides gratuitously
}

setpgrp 0, 0;

# child loops in background
while (1) {
    alarm 60;
    foreach (int rand(3)) {
        $_ == 0 and do { print("Go Left! \n"); last };
        $_ == 1 and do { print("Go Right! \n"); last };
        $_ == 2 and do { print("Wait, go back! \n"); last };
    }
    sleep rand(3)+1;
}
