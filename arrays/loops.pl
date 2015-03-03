#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Test::More;

subtest 'indexes' => sub {
    my @array = 'a'..'d';

    # don't try this for arrayref!
    my $last_index = $#array;
    is $last_index, 3;
    # bonus: you have index
    for (0..$#array) {
        say $array[$_];
    }

    my $is_in = sub {
        state $array_ref = $_[0];
        if (defined $array_ref) {
            my $item = $_[1];
        }
        my $item = $_[1];
        my $shifted = shift $array_ref;
        is $shifted, $item;
    };

    # instead:
    my $array_ref = \@array;
    is $array_ref->[-1], 'd', 'use negative index for last element';
    for (0..@$array_ref-1) {
        $is_in->($array_ref, $array_ref->[$_]);
        say $array_ref->[$_];
    }
};

sub is_in {
  my ($item, @list) = @_;
  do {return 1 if $item eq $_} for (@list);
  return 0;
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
