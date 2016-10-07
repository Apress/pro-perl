#!/usr/bin/perl
# localelement.pl (p249)
our @array=(1,2,3);
{
    local $array[1]=4;
    print @array,"\n"; # produces '143'
}
print @array,"\n", # produces '123'
