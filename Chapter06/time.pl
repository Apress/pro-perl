#!/usr/bin/perl
# time.pl (p168)
use warnings;

# a bare block definition
{
    # define six scalars in new block scope:
    my ($sec, $min, $hour, $day, $month, $year) = localtime();
    # variables exist and can be used inside block
    print "The time is: $hour:$min.$sec \n";
    $month++;
    $year += 1900;
    print "The date is: $year/$month/$day \n";
    # end of block - variable definitions cease to exist
}

# produces 'uninitialized value' warning - $sec does not exist here
print "$sec seconds \n";
