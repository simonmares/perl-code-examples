#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my $arrayref = [qw(- - - -)];
my $another = [qw(yes no no)];
# we can splice arrayref in-place (but its experimental)
# must provide replacement as a list
splice @$arrayref, 1, 2, @$another;
# two items will has been replaced with list (any number of items)
is_deeply $arrayref, [qw(- yes no no -)];

done_testing();