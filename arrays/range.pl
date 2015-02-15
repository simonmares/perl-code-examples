#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

# range is inclusive
is_deeply [1..3], [1, 2, 3];

# .. and ... are same
is_deeply [1...3], [1, 2, 3];

done_testing();