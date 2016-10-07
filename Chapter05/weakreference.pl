#!/usr/bin/perl -w
# weakreference.pl (p141)
use Scalar::Util qw(weaken isweak);

my $node1={next => undef, last => undef, value => "First item"};
my $node2={next => undef, last => $node1, value => "Next Item"};
$node1->{next}=$node2; # create a reference loop

weaken $node1->{next};
print "node1->next is ",
   (isweak($node1->{next})?"weak":"hard"),"\n"; # produces 'node1->next is weak'
print "node2 is ",(isweak($node2)?"weak":"hard"),"\n"; # produces 'node2 is hard'
$node1=undef; $node2=undef; # no more memory leak
