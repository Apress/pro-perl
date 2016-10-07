#!/usr/bin/perl
# typedscalar.pl (p133)
use strict;
use warnings;

{
    package My::Package;

    use fields qw(one two three);

    sub new {
        my $class = shift;
        return fields::new($class);
    }
}

print "This happens first?\n";
my My::Package $obj=new My::Package;
#my $obj=new My::Package;

$obj->{one}=5;  # Ok, exists
$obj->{four}=4; # ERROR: Bad key

