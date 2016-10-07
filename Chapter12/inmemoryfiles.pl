#!/usr/bin/perl
# inmemoryfiles.pl (p402)
use strict;
use warnings;

my $text="The Giant's Game\nThe End Of The World\n";

open MEMFILE, "<", \$text;
print scalar(<MEMFILE>); # produces "The Giant's Game"
close MEMFILE;

my $log="";
open LOGFILE, ">", \$log;
print LOGFILE "The Enemy's Gate";
print LOGFILE " is down\n";
close LOGFILE;
print $log;      # produces "The Enemy's Gate Is Down"
