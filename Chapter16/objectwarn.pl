#!/usr/bin/perl
# objectwarn.pl (p582)
use strict;
use warnings;

{
    package Ship::Announcement;
    use warnings::register;

    sub new {
        my ($class,$msg)=@_;
        $msg ||= "No message";
        return bless \$msg, (ref($class) or $class);
    }
}

my $msg = new Ship::Announcement("Please return to the Bomb Bay immediately"); warnings::warn($msg => $$msg);
