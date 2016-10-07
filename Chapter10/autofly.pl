#!/usr/bin/perl
# autofly.pl (p290)
use warnings;
use strict;

sub AUTOLOAD {
    our $AUTOLOAD;

    my $tag;
    $AUTOLOAD =~ /([^:]+)$/ and $tag = $1;

    SWITCH: foreach ($tag) {
        /^start_(.*)/ and do {
            eval "sub $tag { return \"<$1>\@_\" }";
            last;
        };
        /^end_(.*)/ and do {
            eval "sub $tag { return \"</$1>\" }";
            last;
        };
        # note the escaping with \ of @_ below so it is not
        # expanded before the subroutine is defined
        eval "sub $tag { return \"<$tag>\@_</$tag>\" }";
    }
    no strict 'refs';
    &$tag; # pass @_ directly for efficiency
}

# generate a quick HTML document
print html(
    head(title('Autoloading Demo')),
    body(ul(
        start_li('First'),
        start_li('Second'),
        start_li('Third'),
    ))
);
