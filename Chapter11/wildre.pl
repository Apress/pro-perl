#!/usr/bin/perl
# wildre.pl (p376)
use warnings;
use strict;

$| = 1;   # enable autoflush for prompt display of prompt (sic)

while (print "Wildcard: " and $_=<>) {
    chomp;
    print "Regular Expression: ", wild2re($_), "\n";
}

sub wild2re {
    my $re = shift;
    $re =~ s/([^\w\s])/($1 eq '?')?'.'
      :($1 eq '*')?'.*' :($1 eq '[' || $1 eq ']')?$1
        :"\\$1"/eg; return "^$re\$";   #anchor at both ends
}
