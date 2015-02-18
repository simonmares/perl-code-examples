#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

subtest 'splice' => sub {
    my $arrayref = [qw(- - - -)];
    my $another = [qw(yes no no)];
    # we can splice arrayref in-place (but its experimental)
    # always must provide replacement as a list
    splice @$arrayref, 1, 2, @$another;
    # two items has been replaced with list (any number of items)
    is_deeply $arrayref, [qw(- yes no no -)];
};

subtest 'push array to array' => sub {
    my @first = (1, 2, 3);
    my @second = (4, 5, 6);
    my @array_concat = (@first, @second);
    is_deeply \@array_concat, [1, 2, 3, 4, 5, 6], 'create new array from 2';
    my $arrayref = [];
    push $arrayref, @first;
    push $arrayref, @second;
    is_deeply $arrayref, [1,2,3,4,5,6], 'can push also a list';
};

done_testing();
