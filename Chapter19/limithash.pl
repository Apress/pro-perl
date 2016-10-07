#!/usr/bin/perl
# limithash.pl (p812)
use warnings;
use strict;

use Limit::Hash;

tie my %hash, 'Limit::Hash', 'this', 'that', 'other';

$hash{this} = 'this is ok';
$hash{that} = 'as is this';
print $hash{this}, "\n";
$hash{'invalid-key'} = 'but this croaks';
