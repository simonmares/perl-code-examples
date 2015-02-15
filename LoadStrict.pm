package LoadStrict;
# this applies only for this file
use strict;
use warnings;

# for every file which use this module
sub import {
    $_->import for qw(strict warnings utf8);
}

# module loaded
return 1;