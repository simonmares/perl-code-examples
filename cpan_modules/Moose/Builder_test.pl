use lib '../../';
use LoadStrict;
use Builder;
use Test::More;

subtest 'it creates constructor new for us' => sub {
    my $obj = Builder->new();
    ok $obj;
};

subtest 'it has properties' => sub {
    my $obj = Builder->new();
    is $obj->content, undef, 'unspecified value is undef, of course';
    # property used as setter
    $obj->content('stone');
    is $obj->content, 'stone', 'property called as getter';
    is $obj->{content}, 'stone', 'property is accessible through key too';
};


done_testing();
