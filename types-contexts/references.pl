#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

subtest 'default value for arrayref' => sub {
    my ($array_ref, @array);
    is(ref $array_ref, '', 'undef scalar');
    is $array_ref, undef;
    is_deeply \@array, [];

    my $array = [];
    is(ref $array, 'ARRAY', 'always initialize arrayref');
};

subtest 'ref operator' => sub {
    my ($array_ref, $hash_ref, $code_ref) = ([], {}, sub {});
    is(ref $array_ref, 'ARRAY');
    is(ref $hash_ref, 'HASH');
    is(ref $code_ref, 'CODE');
};

my $array_ref = [1, 2];
is scalar @$array_ref, 2;

done_testing;
