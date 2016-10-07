#!/usr/bin/perl
# mysimpletest.pl (p634, adapted)
use strict;
use warnings;
use Test::Simple tests => 4;

my $file='simpletestfile';
ok write_file($file);         # test subroutine, no test name
ok (-f $file,"file created"); # test file exists, test named

my @array=@ARGV; # pass an argument to see the test pass
ok (@array,"not empty");
ok (scalar(@array),"not empty");

#--

sub write_file ($) {
    system 'touch',$_[0];
}
