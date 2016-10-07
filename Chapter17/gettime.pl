#!/usr/bin/perl
# gettime.pl (p650)
use warnings;
use strict;

my ($user1, $system1) = times;
my ($a, $t);

# repeat a loop one million times
foreach (1..1_000_000) {
    # incur some user time
    $a += 2**2000;
    # incur some system time
    $t = time;
}
my ($user2, $system2) = times;

# compute times
my $user = $user2 - $user1;
my $system = $system2 - $system1;
my $total = $user + $system;

print "Time taken: user = $user system = $system total = $total \n";
