#!/usr/bin/perl
# paginate.pl (p708)
use warnings;
use strict;

no strict 'refs';

use Getopt::Long;

# get parameters from the user
my $height = 60;  # length of page
my $width = 80;   # width of page
my $quote = "";   # optional quote prefix
GetOptions ('height|size|length:i', \$height,
    'width:i', \$width, 'quote:s', \$quote);

die "Must specify input file" unless @ARGV;

# get the input text into one line, for continuation
undef $/;
my $text = <>;

# set the page length
$= = $height;

# if we're quoting, take that into account
$width -= length($quote);

# define the main page format - a single autorepeating continuation field
my $main_format = "format STDOUT = \n".
                  '^'.$quote.('<' x ($width-1))."~~\n".
                  '$text'. "\n".
                  ".\n";
eval $main_format;

# define the top of page format
my $page_format = "format STDOUT_TOP = \n".
                  '@'.('<' x ($width/2-6)). ' page @<<<'. "\n".
                  '$ARGV,$%'. "\n".
                  '-'x$width. "\n".
                  ".\n";
eval $page_format;

# write out the result
write;
