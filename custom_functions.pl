#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

# split string
is_deeply [split(',', '86846,86848')], [qw(86846 86848)];

# list join
is join(',', qw(86846 86848)), '86846,86848';

done_testing;