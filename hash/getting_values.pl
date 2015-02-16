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
# you're dereferencing hashref in list (not $scalar) context
# if its clear to you, you quite understand perl
my @values = @$hash{qw/fruit vegie/};
is_deeply \@values, [qw/apple carrot/];



# arrayref TODO: add to own file

my $arrayref = \((1, 2, 3));
is_deeply $arrayref, [1,2,3];

done_testing();
