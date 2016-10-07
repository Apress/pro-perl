use Test;
BEGIN { plan tests => 6 };
use Serial::Module qw(newserial_nonptr number_nonptr);
use Scalar::Util qw(reftype);

#########################

my ($result,$serial);

$serial=newserial_nonptr("The Answer" => 42);
ok(ref $serial,"Serial");
ok(reftype $serial,"HASH");
ok($serial->{name},"The Answer");
ok($serial->{number},42);

# test passing a non-href
eval { number_nonptr("not a hash ref") };
ok($@ =~ "serial is not a hash reference", 1);

$result=number_nonptr($serial);
ok($result,42);
