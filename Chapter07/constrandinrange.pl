#!/usr/bin/perl -w
# constrandinrange.pl (p237)
use strict;

{
    my %cached;

    sub constrandinrange ($) {
        my $range=shift;
        unless ($cached{$range}) {
            $cached{$range}=int(rand $range)+1;
        }

        return $cached{$range};
    }
}

print constrandinrange(10),"\n";
print constrandinrange(20),"\n";
print constrandinrange(10),"\n";
print constrandinrange(20),"\n";
