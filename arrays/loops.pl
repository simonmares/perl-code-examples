#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use 5.010;
sub is_in {
  my ($item, @list) = @_;
  return ($item ~~ @list)
}

# range, alternative to for
for (1..2) {
    ok is_in $_, (1, 2);
}

# foreach is used to iterate through all items of list
foreach my $item (1, 2, 3) {
  ok is_in $item, (1, 2, 3);
}

foreach (1, 2, 3) {
  ok is_in $_, (1, 2, 3);
}

# foreach is same as for
my @list = (1, 2);
for (@list) {
  ok is_in $_, (1, 2);
}

for (my $idx = 0; $idx < scalar @list; $idx++) {
  ok is_in $list[$idx], @list;
}

done_testing(); 