#!/usr/bin/perl
# attrhandler2.pl (p312)
use strict;
use warnings;
use Attribute::Handlers;

{
    package UNIVERSAL;
    use Time::HiRes qw(gettimeofday);

    # calculate the startup time
    sub Startup : ATTR(HASH,BEGIN,INIT,CHECK) {
        my ($pkg,$sym,$ref,$attr,$data,$when)=@_;

        if ($when eq 'BEGIN') {
            # at begin, store current time
            my ($secs,$usecs)=gettimeofday();
            %$ref=( secs => $secs, usecs => $usecs );

            print "Startup BEGIN...\n";
        } elsif ($when eq 'INIT') {
            # at init, calculate time elapsed
            my ($secs,$usecs)=gettimeofday();
            $ref->{secs} = $secs - $ref->{secs};
            $ref->{usecs} = $usecs - $ref->{usecs};
            if ($ref->{usecs} < 0) {
                $ref->{usecs} += 1_000_000;
                $ref->{secs} -= 1;
            }

            print "Startup INIT...\n";
        } else {
            # we could do something time-consuming here
            print "Startup CHECK...\n";
        }
    }
}

our %time : Startup;

BEGIN { print "Beginning...\n";    sleep 1 }; #happens after Startup BEGIN
CHECK { print "Checking...\n";     sleep 1 }; #between Startup BEGIN and INIT
INIT  { print "Initialising...\n"; sleep 1 }; #happens after Startup INIT

print "BEGIN+CHECK took ",$time{secs}*1_000_000+$time{usecs},"uS\n";
