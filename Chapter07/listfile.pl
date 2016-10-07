#!/usr/bin/perl
# listfile.pl (p235)
use warnings;
use strict;

sub list_files {
    die "Function called in void context" unless defined wantarray;
    my $path = shift;

    return unless defined $path;
    chomp $path;   #remove trailing linefeed, if present
    $path.='/*' unless $path =~/\*/;   #add wildcard if missing
    my @files = glob $path;
    return wantarray?@files:\@files;
}

my $path = $ARGV[0] || print("Enter Path: ") && <>;

# call subroutine in list context
print "Get files as list:\n";
my @files = list_files($path);
foreach (sort @files) {
    print "\t$_\n";
}

# call subroutine in scalar context
print "Get files as scalar:\n";
my $files = list_files($path);
foreach (sort @{$files}) {
    print "\t$_ \n";
}

# to get a count we must now do so explicitly with $#...
# note that 'scalar would not work, it forces scalar context.
my $count = $#{list_files($path)}+1;
print "Count: $count files\n";

# call subroutine void context - generates an error
list_files($path);
