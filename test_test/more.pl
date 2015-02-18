#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

subtest 'regexes' => sub {
    like "Expected", qr/expected/i;
    unlike "Hello foo", qr/bar/;
};

subtest 'is_deeply for hash' => sub {
    my $hash = {Greet => "Hello"};
    my $hash2 = {Greet => "Hello"};

    isnt $hash2, $hash, 'different references';
    is $hash, $hash, 'compare scalar - reference';
    is_deeply $hash, $hash, 'compare keys and values';
    is_deeply $hash, $hash2;

    my %hash_bad_value = %$hash;
    $hash_bad_value{Greet} = 'Bad value';
    note 'fail, different values';
    is_deeply $hash, \%hash_bad_value;

    my %hash_bad_key = %$hash;
    $hash_bad_key{Foo} = undef;
    # $got->{Foo} = Does not exist
    note 'fail, different keys';
    is_deeply $hash, \%hash_bad_key;
};


my $foo = 'foo';
my $bar = 'foo';

ok $foo eq $bar, 'foo is bar';
is $foo, $bar, 'better diagnostics if fails';

subtest 'ok for truthy value' => sub {
    ok 1;
    ok '1';
    ok [];
    ok {};
    ok(sub {});

};

done_testing;
