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

subtest 'cancatenating arrays' => sub {
    my @first = (1, 2, 3);
    my @second = (4, 5, 6);
    my $expected = [1, 2, 3, 4, 5, 6];

    subtest 'new array from others' => sub {
        my @array_concat = (@first, @second);
        is_deeply \@array_concat, $expected, 'create new array from 2';       <`2`>
    };

    subtest 'push' => sub {
        my $arrayref = [];
        push $arrayref, @first;
        push $arrayref, @second;
        is_deeply $arrayref, $expected, 'can push also a list';
    };

};

done_testing();
