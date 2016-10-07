use Test;
BEGIN { plan tests => 1 };
use Serial::Module qw(newserial number);

#########################

my ($result,$serial);

$serial=newserial("The Answer" => 42);
$result=number($serial);
ok($result,42);
