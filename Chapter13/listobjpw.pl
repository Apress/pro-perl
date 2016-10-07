#!/usr/bin/perl
# listobjpw.pl (p450-451)
use warnings;
use strict;

use User::pwent qw(:DEFAULT pw_has);

print "Supported fields: ", scalar(pw_has), "\n";

while (my $user = getpwent) {
    print 'Name    : ', $user->name, "\n";
    print 'Password: ', $user->passwd, "\n";
    print 'User ID : ', $user->uid, "\n";
    print 'Group ID: ', $user->gid, "\n";

    # one of quota, change or age
    print 'Quota   : ', $user->quota, "\n" if pw_has('quota');
    print 'Change  : ', $user->change, "\n" if pw_has('change');
    print 'Age     : ', $user->age, "\n" if pw_has('age');
    # one of comment or class (also possibly gcos is comment)
    print 'Comment : ', $user->comment, "\n" if pw_has('comment');
    print 'Class   : ', $user->class, "\n" if pw_has('class');

    print 'Home Dir: ', $user->dir, "\n";
    print 'Shell   : ', $user->shell, "\n";

    # maybe gecos, maybe not
    print 'GECOS : ',$user->gecos,"\n" if pw_has('gecos');

    # maybe expires, maybe not
    print 'Expire : ', $user->expire, "\n" if pw_has('expire');

    # separate records
    print "\n";
}

