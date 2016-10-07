#!/usr/bin/perl
# factorial.pl (p238)
use warnings;
use strict;

# factorial closure
{
    my @cache=(0,1); # prep the cache

    # the subroutine
    sub factorial {
        my $input = shift; # read passed argument

        # get the number of the highest so far
        my $highest = $#cache;

        # do we already have the answer cached?
        if ($input > $highest) {
            # calculate remaining terms
            foreach ($highest+1 .. $input) {
                $cache[$_] = $cache[$_-1] * $_;
            }
        }

        # return answer
        return $cache[$input];
    }
}

my $number;
do {
    $number=<>;    # read a number from the keyboard
    chomp $number; # remove linefeed

    # call the subroutine with $number
    my $result=factorial($number);

    print "$number factorial is $result\n";
} while ($number > 0);
