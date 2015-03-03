#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;



my %hash;
ok !exists $hash{create_key};
$hash{create_key} = undef;
ok exists $hash{create_key};
ok !defined $hash{create_key};

delete $hash{create_key};
is keys %hash, 0;

my @p = (1, 2, 3, 4, 5);
for (@p) {$_ += 10; print "$_, "; };

done_testing();

