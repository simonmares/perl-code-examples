#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my $scalar;
no warnings;
$scalar = (1, 2, 3);
# warning
# comma operator evaluates expression from left to right (its operands)
# last value will be evaluated
# () in scalar context doesn't exist, it changes priority
is $scalar, 3;

$scalar = 1, 2, 3;
is $scalar, 1;
use warnings;

my @array;
@array = ('a'..'c');

subtest 'implicit scalar context' => sub {
    ok (@array < 4, 'implicit scalar context by operator');
    is_deeply [1..@array], [1, 2, 3];
};

subtest 'explicit scalar context' => sub {
    is(scalar @array, 3, 'explicit scalar context negotiation');
};

done_testing;
