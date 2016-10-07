#!/usr/bin/perl
# document.pl (additional)
use warnings;
use strict;
use Document;

open my $fh, "<$0" or die "?? $!"; #use our own source for document
my $doc=new Document($fh);
close $fh;

# extended example - rendering the document
print $$doc; # directly access data
print $doc->toString(); #render via method
print $doc; #render via overload of "" (string context)

