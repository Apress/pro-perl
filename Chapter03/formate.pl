#!/usr/bin/perl
# formate.pl (p63)
use warnings;
use strict;

print format_email('me@myself.net', 'you@yourself.org', "Wishing you were here",
                   "...instead of me!", "Regards, Me");

# subroutines will be explained fully in Chapter 7
sub format_email {
    my ($me, $to_addr, $subject, $body_of_message, $signature) = @_;

    return <<_EMAIL_;
To: $to_addr
From: $me
Subject: $subject

$body_of_message
--
$signature
_EMAIL_
}
