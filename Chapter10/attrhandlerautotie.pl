#!/usr/bin/perl
# attrhandlerautotie.pl (p315)
use strict;
use warnings;
use Attribute::Handlers autotie => {Database => 'MLDBM'};
use Fcntl qw(O_RDWR O_CREAT);

my %dbm : Database(mydbmfile,O_RDWR|O_CREAT,0666);
$dbm{key} = 'value';
