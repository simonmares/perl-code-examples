#!/usr/bin/env perl
use strict;
use Test::More;

my $initial_hash = {db => 0, color => 0, font => 'none'};
my $passed = {db => 1};

$initial_hash->{$_} = $passed->{$_} for (keys %$passed);
is_deeply $initial_hash, {db => 1, color => 0, font => 'none'};

done_testing();

