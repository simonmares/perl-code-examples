#!/usr/bin/env perl
use strict; use warnings;
use Test::More;

my $hash = { fruit => 'apple', vegie => 'carrot', };
my %first_class_hash = %$hash;

# you can get a list of values for list of keys
# pretty useful! :)
my ($fruit, $vegie) = @first_class_hash{ qw( fruit vegie )};
is $fruit, 'apple';
is $vegie, 'carrot';

# you can do this for hashref too
# a little confusing, dereferencing with ${$hash} is replaced to @{$hash}, arrayref is created in place?
my @values = @$hash{qw/fruit vegie/};
is_deeply \@values, [qw/apple carrot/];

done_testing();
