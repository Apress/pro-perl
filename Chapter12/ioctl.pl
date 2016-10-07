#!/usr/bin/perl
# ioctl.pl (p442)
use warnings;
use strict;

# require 'linux/cdrom.ph';

open CDROM, '/dev/cdrom' or die "$!";
ioctl CDROM, 0x5309, 1;   # the ioctl number for CDROMEJECT
# ioctl CDROM, &CDROMEJECT, 1;
close CDROM;
