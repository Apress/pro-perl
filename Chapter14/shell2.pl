#!/usr/bin/perl
# shell2.pl (p531-532)
use warnings;
use strict;

# create readline object
use Term::ReadLine;

my $term = new Term::ReadLine "Perl Shell";

# switch off any highlighting
$term->ornaments(0);

# Enable autoflush (output appears instantly)
$|=1;

# Declare some variables
my $this;   # current line
my $input;   # accumulated input
my $bracing = 0;   # number of unclosed open braces

# Evaluate entered expressions until 'quit'
while (($this = $term->readline("perl> ")) ne "quit") {
    if ($this =~ s/\\$//) {
        # if the line ends with '\', collect more lines
        $input = $this;
        # keep track of the braces even so
        $bracing += ($this =~ /{\s*$/);
        $bracing -= ($this =~ /^\s*}/);
        # get the next line and redo
        $this = $term->readline(" > ");
        redo;
    } else {
        # doesn't end with '\'
        $input.= $this;
        # keep track of the braces
        $bracing += ($this =~ /{\s*$/);
        $bracing -= ($this =~ /^\s*}/);
        # if braces outstanding, collect more lines
        if ($bracing) {
            $this = $term->readline("{$bracing} > ");
            redo;
        }
    }

    if ($input =~ s/^!\s*//) {
        # input beginning with '!' is a system command
        system $input;
    } elsif ($input =~ s/^\?\s*//) {
        # input beginning with `?` is a 'perldoc' query
        if ($input =~ /^([A?Z]|perl)/) {
            # straight perldoc if it's capitalized or starts 'perl'
            system "perldoc",$input;
        } else {
            # otherwise assume it's a function
            system "perldoc","-f",$input;
        }
    } else {
        # Evaluate it as Perl code
        eval $input;
        warn($@),undef $@ if $@;
    }

    $input="";
}
