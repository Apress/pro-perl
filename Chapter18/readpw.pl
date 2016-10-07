#!/usr/bin/perl
# readpw.pl (p663)
use warnings;
use strict;

use Text::ParseWords;

my (@users, @fields);
if (open PASSWD,"/etc/passwd") {
    @users = <PASSWD>;
    chomp @users; # remove linefeeds
    @fields = quotewords(':', 0, @users);
    close PASSWD;
}
print "@fields";
