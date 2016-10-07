#!/usr/bin/perl
# restrictedhash.pl (p132)

use strict;
use warnings;
use Hash::Util qw(lock_keys unlock_keys lock_hash unlock_hash
                  lock_value unlock_value);

my %hash1=(one =>'first', two=>'second', three=>'third');
lock_keys(%hash1);                   # lock hash to pre-existing keys

unlock_keys(%hash1);                 # unlock all keys

my %hash2;
lock_keys(%hash2,'one','two','six'); # lock empty hash with the specified keys
lock_value(%hash2,'one');            # lock the value of key 'one'
lock_value(%hash2,'two');            # lock the value of key 'two'
unlock_value(%hash2,'two');          # unlock the value of key 'two'

my %hash3=(oldkey1=>1, oldkey2=>2);
lock_keys(%hash3,keys(%hash3),'newkey1','newkey2');

lock_hash(%hash3);             # lock hash keys and make all values read-only
unlock_hash(%hash3);           # turn back into a regular unrestricted hash

