#!/usr/bin/perl
# password.pl (p664)
use Text::ParseWords;

@ARGV = ('/etc/passwd');
my @users = nested_quotewords(':', 0, <>);

print scalar(@users)," users: \n";
print "\t${$_}[0] => ${$_}[2] \n" foreach @users;
