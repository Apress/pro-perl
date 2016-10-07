use Test;
BEGIN { plan tests => 3 };
use Heavy::Fraction qw(difference convert_int convert_int2);

#########################

my $result;

$result=difference(8,3);
ok($result,5);

convert_int(42,$result);
ok($result,84);

$result=convert_int2(42);
ok($result,84);
