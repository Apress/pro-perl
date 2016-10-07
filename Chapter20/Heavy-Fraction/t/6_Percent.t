use Test;
BEGIN { plan tests => 2 };
use Heavy::Fraction qw(percentage);

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $result;

$result=Heavy::Fraction::percentage(6,10);
ok($result,60);

$result=Heavy::Fraction::percentage(10,6);
ok($result,0);
