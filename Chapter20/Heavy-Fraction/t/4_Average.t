use Test;
BEGIN { plan tests => 2 };
use Heavy::Fraction qw(average);

#########################

my $result;

$result=average(4,8,16,64);
ok($result,23);

$result=average(19,34,77);
ok($result,43);
