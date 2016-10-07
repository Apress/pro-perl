use Test;
BEGIN { plan tests => 2 };
use Heavy::Fraction qw(positive_or_undef);

#########################

my $result;

$result=Heavy::Fraction::positive_or_undef(4);
ok($result==4);

$result=Heavy::Fraction::positive_or_undef(-5);
ok(not defined $result);
