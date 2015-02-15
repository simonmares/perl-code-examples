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

done_testing();
