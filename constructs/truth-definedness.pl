#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my $apple; # undef

ok !(defined $apple);
ok !($apple // '');

$apple = 'eaten';
ok (defined $apple);
ok ($apple // '');

my $zero = 0;

ok !($zero);
ok (defined $zero);
ok !($zero // 1), 'tests if defined';
ok !(undef);


done_testing();
