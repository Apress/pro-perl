#!/usr/bin/perl
# setprototype.pl (p230)
use strict;
use warnings;

use Scalar::Util qw(set_prototype);

sub add_list {
    @_ = @{$_[0]} if ref $_[0]; #accepts list or arrayref
    my $result=0;
    $result = $result + $_ foreach @_;
    return $result;
};

set_prototype \&add_list,'$$$';
print "add_list prototype is (",prototype("add_list"),")\n";
eval 'print "sum is ",add_list(1,2,3),"\n"'
  or die "eval failed: $@";

set_prototype \&add_list,'\@';
print "add_list prototype is (",prototype("add_list"),")\n";
my @list=(1,2,3,4,5);
eval 'print "sum is ",add_list(@list),"\n"'
  or die "eval failed: $@";

set_prototype \&add_list,'$$$$$';
print "add_list prototype is (",prototype("add_list"),")\n";
eval 'print "sum is ",add_list(1,2,3),"\n"'
  or die "eval failed: $@"; # ERROR!
