#!/usr/bin/perl
# attrhandler1.pl (p311)
use strict;
use warnings;
use Attribute::Handlers;

{
    package Time;

    sub Now : ATTR(SCALAR) {
        my ($pkg,$sym,$ref,$attr,$data,$when)=@_;
        $$ref=time;
    }
}

my Time $now : Now;
print $now; # produces the time in seconds since 1970/1/1
