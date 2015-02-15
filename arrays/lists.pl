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

done_testing(); 