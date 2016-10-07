#!/usr/bin/perl
# join.pl (p896)
use warnings;
use strict;
# check we have threads
BEGIN {
    use Config;
    die "No interpreter threads!\n" unless $Config{useithreads};
}
use threads;

# define a subroutine for threads to execute
sub threadsub {
    my $self = threads->self;
    print "Thread ", $self->tid, " started \n";
    sleep 10;
    print "Thread ", $self->tid, " ending \n";
}

# start up five threads, one second intervals
my @threads;
foreach (1..5) {
    push @threads, new threads \&threadsub;
    sleep 1;
}

# wait for the last thread started to end
while (my $thread = shift @threads) {
    print "Waiting for thread ", $thread -> tid, " to end... \n";
    $thread->join;
    print "Ended \n";
}

# exit
print "All threads done \n";
