#!/usr/bin/perl
# factorial.pl (p44)

$number=<>;    # read a number from the keyboard
chomp $number; # remove linefeed

# call the subroutine with $number
$factorial=factorial($number);

# The subroutine
sub factorial {
    $input = shift; # read passed argument
    # return zero immediately if given 0 as input
    return 0 if $input==0;
    # otherwise do the calculation
    $result=1;
    foreach (1 .. $input) { # '..' generates a range
        $result *= $_;
    }
    return $result;
}

print "$number factorial is $factorial\n";
