#!/usr/bin/perl
# listfldpw.pl (p451)
use warnings;
use strict;

use User::pwent qw(:FIELDS pw_has);

print "Supported fields: ", scalar(pw_has), "\n";

while (my $user = getpwent) {
    print 'Name    : ', $pw_name, "\n";
    print 'Password: ', $pw_passwd, "\n";
    print 'User ID : ', $pw_uid, "\n";
    print 'Group ID: ', $pw_gid, "\n";

    # one of quota, change or age
    print 'Quota   : ', $pw_quota, "\n" if pw_has('quota');
    print 'Change  : ', $pw_change, "\n" if pw_has('change');
    print 'Age     : ', $pw_age, "\n" if pw_has('age');

    # one of comment or class (also possibly gcos is comment)
    print 'Comment : ', $pw_comment, "\n" if pw_has('comment');
    print 'Class   : ', $pw_class, "\n" if pw_has('class');

    print 'Home Dir: ', $pw_dir, "\n";
    print 'Shell   : ', $pw_shell, "\n";

    # maybe gcos, maybe not
    print 'GCOS    : ', $pw_gecos, "\n" if pw_has('gecos');
    # maybe expires, maybe not
    print 'Expire  : ', $pw_expire, "\n" if pw_has('expire');

    # separate records
    print "\n";
}
