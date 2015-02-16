#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my $apple = 'real apple';
{
  # own scope in this block, no warnings
  my $apple = 'my own apple';
}
# warning: "my" variable $apple masks earlier declaration in same scope
my $apple = 'not an apple';


done_testing();
