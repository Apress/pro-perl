#!/usr/bin/perl
# mycustomtest.pl (p639)
use Test::More;
use My::Custom::Test::Module plan tests=>2;

is_numeq(6,6,"six of one");
is_eq("Number 6","half a dozen of the other");
