#!/usr/bin/perl -w
# localbuiltinvar.pl (p248)
use strict;

sub printwith {
    my ($separator, @stuff)=@_;
    local $, = $separator; # create temporary local $,
    print @stuff,"\n";
}

printwith("... ","one","two","three");
