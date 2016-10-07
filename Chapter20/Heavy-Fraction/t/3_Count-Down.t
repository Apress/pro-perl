use Test;
BEGIN { plan tests => 27 };
use Heavy::Fraction qw(countdown_list countdown_list2);

#########################

my ($result,@result);

# countdown_list, 1st implementation
@result=countdown_list(7,2);
ok(@result,6," six elements");
ok($result[0],7);
ok($result[1],6);
ok($result[2],5);
ok($result[3],4);
ok($result[4],3);
ok($result[5],2);

# countdown_list, 2nd implementation - list context
@result=countdown_list2(7,2);
ok(@result,6," six elements");
ok($result[0],7);
ok($result[1],6);
ok($result[2],5);
ok($result[3],4);
ok($result[4],3);
ok($result[5],2);

# countdown_list, 2nd implementation - scalar context
# no arg defaults: from=10, to=0
$result=countdown_list2();
ok(ref $result,'ARRAY');
ok(@$result,11," eleven elements");
foreach my $i (0..10) {
    ok($result->[$i], 10-$i);
}
