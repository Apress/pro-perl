#!/usr/bin/perl
# range.pl (p355-356)
# (use 'records.txt' as input to this script)
use warnings;
use strict;

my @records; # list of found records
my $collect = ""; # collection variable for records
my $in = 0; # flag to check if we've just completed a record
while (<>) {
    print "Considering:$_";

    if (/^START/ ... /^FINISH/) {
        # range is true - we are inside a record
        print "In \n";
        # collect lines for record
        $collect .= $_;
        $in = 1;
    } else {
        # false - we are outside a record
        if (not $in) {
            # we were already outside
            print "Out \n";
        } else {
            # we have just left, found a collect
            print "In -> Out \n";
            # add collected lines to list
            push @records, $collect;
            # clear the collection variable
            $collect = "";
            # set flag to say we are out
            $in = 0;
        }
    }
}

foreach (0..$#records) {
    print "Record $_: \n$records[$_] \n";
}
