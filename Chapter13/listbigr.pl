#!/usr/bin/perl
# listbigr.pl
use warnings;
use strict;

use User::grent;

while (my $group = getgrent) {
    print 'Name    : ', $group->name, "\n";
    print 'Password: ', $group->passwd, "\n";
    print 'Group ID: ', $group->gid, "\n";
    print 'Members : ', join(', ', @{$group->members}), "\n\n";
}
