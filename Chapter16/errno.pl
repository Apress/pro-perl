#!/usr/bin/perl
# errno.pl (p586)
use warnings;
use strict;

use Errno;

print "EAGAIN = ", Errno::EAGAIN, "\n" if exists &Errno::EAGAIN;
print "EIO = ", Errno::EIO, "\n" if exists &Errno::EIO;
