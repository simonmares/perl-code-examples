#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

print "Jak se jmenuješ?\n";

my $jmeno = <STDIN>;

print "Jsi $jmeno";

done_testing();
