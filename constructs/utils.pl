#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my $rand = int rand 200;

my $found_rand;
for (0..983) {
    if ($_ == $rand) {
        $found_rand = 1;
        last;
    }
}

ok $found_rand, "random number '$rand' is between 0 and 200";

my $zero_one = int rand;
ok( ($zero_one == 0 or $zero_one == 1), 'implicit range is 0..1');

done_testing();
