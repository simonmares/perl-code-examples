#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

# In Perl they are 7 first-class values.
# That means you can pass them to other parts of your program.
my $scalar_number = 10;
my $scalar_string = 'eehmm';
sub add_linebreak { return $_[0] . "\n" };
my $scalar_regex = qr/(\d)/;
my @array = ('a'..'d');
my %hash = (id => 1, name => 'Hash Referenced');

# Sometimes you need references to these values.
# You get them with backslash operator: \
# In list context it creates reference to all elements. Its doesn't create array reference.
my (
    $scalar_number_ref, $scalar_string_ref, $add_linebreak_ref, $regex_ref, $array_ref, $hash_ref
) = \($scalar_number, $scalar_string, &add_linebreak, $scalar_regex, @array, %hash);

# anonymous functions are always references
my $scalar_sub_ref = sub { return $_[0] . "\n" };

subtest 'dereferencing' => sub {
    is $$scalar_number_ref, 10;
    is $$scalar_string_ref, 'eehmm';
    like '10', $$scalar_regex;
    unlike 'word', $$scalar_regex;
    # -> operator dereferences in scalar context
    is $add_linebreak_ref->('Hello'), "Hello\n";
    is $scalar_sub_ref->('Bye'), "Bye\n";
    is $array_ref->[0], 'a';
    is $array_ref->[3], 'd';
    # dereferencing in list context
    my @array_slice = @$array_ref[0, 3];
    is_deeply \@array_slice, ['a', 'd'];
    is_deeply $array_ref, [qw/a b c d/];
    is_deeply $hash_ref, {id=>1, name=>'Hash Referenced'};
    # Reference is a scalar value, you usually don't need reference to scalar.
    ($scalar_number, $scalar_regex, $scalar_string) = undef;
};

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

subtest 'arrayref' => sub {
    my $array_ref = [1, 2];
    is scalar @$array_ref, 2;
};

done_testing;
