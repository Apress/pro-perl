#!/usr/bin/perl
# lists.pl (p145-146)
use warnings;
use strict;

my (@list_of_hashes, %hash_of_lists, %mixed_bag, $my_object);
my @my_list = (1,2,3,4,5);

@list_of_hashes = (
   { Monday=>1, Tuesday=>2, Wednesday=>3, Thursday=>4, Friday=>5 },
   { Red=>0xff0000, Green=>0x00ff00, Blue=>0x0000ff },
);
print "Tuesday is the $list_of_hashes[0]{Tuesday}nd day of the week.", "\n";

%hash_of_lists = (
    List_1 => [1, 2, 3],
    List_2 => ["Red", "Yellow", "Blue"],
);

print "The second element of List_1 is: $hash_of_lists{List_1}[1]", "\n";

%mixed_bag = (
    Scalar1 => 3,
    Scalar2 => "Hello World",
    List1 => [1, 2, 3],
    Hash1 => { A => 'Horses', C => 'Miles' },
    List2 => ['Hugh','Pugh', ['Barley-McGrew','Cuthbert'], 'Dibble', 'Grubb'],
    Scalar3 => $my_object,
    Hash2 => { Time => [ gmtime ],
               Date => scalar(gmtime), 
    },
    List3 => @my_list[0..2],
);

print $mixed_bag{List2}[2][1]; # produces 'Cuthbert'
