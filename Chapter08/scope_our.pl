#!/usr/bin/perl
# scope-our.pl (p247-248)
use warnings;
use strict;

package MyPackage;

my $my_var = "my-var";         # file-global lexical variable
our $our_var = "our-var";      # global to be localized with 'our'
our $local_var = "global-var"; # global to be localized with 'local'
use vars qw($use_var);         # define 'MyPackage::use_var' which exists
                               # only in this package

$use_var = "use-var";

package AnotherPackage;

print "Outside, my_var is '$my_var' \n";       # display 'my-var'
print "Outside, our_var is '$our_var' \n";     # display 'our-var'
print "Outside, local_var is '$local_var' \n"; # display 'global-var'

#-----

sub sub1 {
    my $my_var = "my_in_sub1";
    our $our_var = "our_in_sub1";
    local $local_var = "local_in_sub1";

    print "In sub1, my_var is '$my_var'\n";       # display 'my_in_sub1'
    print "In sub1, our_var is '$our_var'\n";     # display 'our_in_sub1'
    print "In sub1, local_var is '$local_var'\n"; # display 'local_in_sub1'

    sub2();
}

sub sub2 {
    print "In sub2, my_var is '$my_var'\n";       # display 'my-var'
    print "In sub2, our_var is '$our_var'\n";     # display 'our-var'
    print "In sub2, local_var is '$local_var'\n"; # display 'local_in_sub1'
}

#-----

sub1();

print "Again outside, my_var is '$my_var' \n";       # display 'my-var'
print "Again outside, our_var is '$our_var' \n";     # display 'our-var'
print "Again outside, local_var is '$local_var' \n"; # display 'global-var'
