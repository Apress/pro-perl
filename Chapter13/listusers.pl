#!/usr/bin/perl
# listusers.pl (p449)
use warnings;
use strict;

my @users;
while (my $name = getpwent) {
    push @users, $name;
}
print "Users: @users \n";
