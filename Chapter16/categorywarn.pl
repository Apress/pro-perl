#!/usr/bin/perl
# categorywarn.pl (p582)
use strict;
use warnings;

{
    package Ship::Announcement;
    use warnings::register;
}

warnings::warn("Ship::Announcement" =>
    "Pinback, it's your turn to feed the alien");
