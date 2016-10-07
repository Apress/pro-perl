#!/usr/bin/perl -w
# locksub.pl (p894-895)
use strict;
use warnings;
use threads;
use threads::shared;

{ my $lock : shared;
  sub mysub {
      print "Thread ",threads->self->tid()," waiting for access\n";
      lock $lock;
      print "I am thread ",threads->self->tid(),"\n";
      sleep 1;
      threads->detach();
  }
}

foreach (1..5) {
    threads->create(\&mysub);
}

do {
    sleep 1;
    print "Waiting for threads:",(map { " ".$_->tid } threads->list),"\n";
} while (threads->list);
