#!/usr/bin/perl
# blockmain.pl (p169)

# Declarations First
use strict;
use warnings;

# Initialization code, global scope
my $global_variable = "All the World can see Me";
use constant MY_GLOBAL_CONSTANT => "Global Constant";

# Here is the main program code
MAIN: {
    # variable defined in the main program scope, but not global
    my $main_variable = "Not visible outside main block";
    print_variables ($main_variable);
}

# No one here but us subroutines...

sub print_variables {
    print $global_variable, "\n", MY_GLOBAL_CONSTANT, "\n";
    # print $main_variable, "\n"; #error!
    print $_[0], "\n"; # passed from main block, ok now
}
