#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

# lists are always flat
is_deeply[('one', 'two', qw(three four))], [
  qw(one two three four)
];

my @list = (1, (2, 3, (4, 5)));
is @list, 5;


# TODO: sorting,

my @unsorted = (6, 1, 3, 5, 4, 2);
my @maybe_sorted = sort { int rand 2} @unsorted;
say "@maybe_sorted";


subtest 'grep is filter' => sub {
    # 1) numbers
    my @filtered = grep {$_<5} (1..10);
    is_deeply \@filtered, [1,2,3,4];
    # 2) strings
    my @names = qw/Tom Thomas Thompson Timmy Timerlake/;
    # here you actually don't need explicitly write implicit var $_, its an operator working on it
    my @toms = grep {/T.*o.*m.*/} @names;
    is_deeply \@toms, [qw/Tom Thomas Thompson/];

};


done_testing();
