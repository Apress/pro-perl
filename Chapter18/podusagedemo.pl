#!/usr/bin/perl
# podusagedemo.pl (p688-689)
use strict;
use warnings;
use Pod::Usage;
use Getopt::Long qw(:config bundling no_ignore_case);

=head1 NAME

A demonstration of Pod::Usage

=head1 SYNOPSIS

  podusagedemo.pl -h | -H | -l | -r [<files>]

=head1 OPTIONS

  -h|--help      this help
  -H|--morehelp  extended help
  -l|--left      go left
  -r|--right     go right

=head1 ARGUMENTS

One or more files may be specified as arguments, otherwise
standard input is used. (Both this section and OPTIONS are
are displayed by the -h option)

=head1 DESCRIPTION

This is the extended help displayed by the -H option

=cut

my %opts;

pod2usage(-verbose=>0) unless GetOptions(\%opts,qw[
    h|help H|m|morehelp l|left r|right
]);
pod2usage(-verbose=>1)  if  $opts{h};
pod2usage(-verbose=>2)  if  $opts{H} or $opts{m};

pod2usage(-verbose=>2, "Cannot go both left and right")
  if $opts{l} and $opts{r};

# ...
