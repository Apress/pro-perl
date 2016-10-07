#!/usr/bin/perl
# attrhandler3.pl (p313)
use strict;
use warnings;
use Attribute::Handlers;

{
    package MyPackage;

    sub Set : ATTR(SCALAR) {
        my ($pkg,$sym,$ref,$attr,$data,$when)=@_;
        $$ref=$data;
    }
}

my MyPackage $list : Set(a,b,c);
print "@$list\n"; # prodices 'a b c'
my MyPackage $aref : Set([a,b,c]);
print "@$aref\n"; # produces 'ARRAY(0xNNNNNN)'
my MyPackage $string : Set('a,b,c');
print "$string\n"; # produces 'a,b,c'
my MyPackage $href : Set({a=>1,b=>2,c=>3});
print map {
    "$_ => $href->{$_}\n"
} keys %$href;
# produces 'a => 1' ...
my MyPackage $qwaref : Set(qw[a b c]);
print "@$qwaref\n"; # produces 'a b c'
