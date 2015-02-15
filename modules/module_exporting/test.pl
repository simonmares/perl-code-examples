use ExportModule;
use Test::More;
use strict;
use warnings;

# (re)declare it here for clarity
our @ok_array;
our %ok_hash;
our %anything;
our $ok_scalar;

subtest 'module symbols are always accessible with prefix' => sub {
    is $ExportModule::ok_scalar, 'ok';
    is ExportModule::ok_sub(), 'ok';
};

subtest 'symbols defined in @EXPORT are accessible without prefix' => sub {
    is $ok_array[0], 'ok';
    is $ok_array[1], 'still ok';
    # these are not:
    is $ok_hash{-ok}, undef;
    is %ok_hash, 0;
    is %anything, 0;
    is $ok_scalar, undef;
};

  # subtest 'not exported' => sub { }

done_testing();
