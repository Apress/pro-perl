package Extended::DBI;
use strict;
use DBI;
our @ISA=qw(DBI);

my @cache;

sub do_later {
	my ($dbh,$statement)=@_

	push @cache, $statement;
}

sub do_now {
	my @result=map { $dbh->do($_) } @cache;
	@cache=();
	return @result;
}

1;
