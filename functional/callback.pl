#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

# function reference as scalar value
my $printed = [];
my $print_node = sub {push $printed, $_[0]};
$print_node->($_) for (qw/hello bye ciao hi/);
is @$printed, 4;

# normal subroutine, getting reference with &
my $sub_version = [];
sub print_node_sub {
  push $sub_version, $_[0]. "+";
}
&print_node_sub($_) for (qw/hello bye morning/);
is @$sub_version, 3;

# with 

done_testing();