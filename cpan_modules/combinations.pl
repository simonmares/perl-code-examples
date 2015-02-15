#!/usr/bin/env perl
use warnings;
use strict;
use Test::More;

use Algorithm::Combinatorics qw(combinations);
 
my @data = qw(1 2 3 4);
my @combinations = [];

for (1..(scalar @data)) {
    push @combinations, combinations(\@data, $_);
}

use Data::Dumper;
print Dumper( @combinations );

is scalar @combinations, 16;

done_testing();