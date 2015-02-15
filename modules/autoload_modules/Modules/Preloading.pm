package Preloading;
# only for this file
use strict;
use warnings;

sub import {
    $_->import for qw(strict warnings utf8);
}

# module loaded
return 1;