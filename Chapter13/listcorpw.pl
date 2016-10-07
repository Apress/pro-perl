#!/usr/bin/perl
# listcorpw.pl (p452)
use warnings;
use strict;

use User::pwent();

sub User::pwent::has {
    my $self = shift;
    return User::pwent::pw_has(@_);
}

print "Supported fields: ", scalar(User::pwent::has), "\n";

while (my $user = User::pwent::getpwent) {
    print 'Name    : ', $user->name, "\n";
    print 'Password: ', $user->passwd, "\n";
    print 'User ID : ', $user->uid, "\n";
    print 'Group ID: ', $user->gid, "\n";

    # one of quota, change or age
    print 'Quota   : ', $user->quota, "\n" if $user->has('quota');
    print 'Change  : ', $user->change, "\n" if $user->has('change');
    print 'Age     : ', $user->age, "\n" if $user->has('age');

    # one of comment or class (also possibly gcos is comment)
    print 'Comment : ', $user->comment, "\n" if $user->has('comment');
    print 'Class   : ', $user->class, "\n" if $user->has('class');

    print 'Home Dir: ', $user->dir, "\n";
    print 'Shell   : ', $user->shell, "\n";

    # maybe gcos, maybe not
    print 'GECOS   : ', $user->gecos, "\n" if $user->has('gecos');

    # maybe expires, maybe not
    print 'Expire  : ', $user->expire, "\n" if $user->has('expire');
    # separate records
    print "\n";
}
