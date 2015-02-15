#!/usr/bin/perl
use strict;
use warnings;

my @array = ({
    id      => 1,
    name    => 'Bob',
},{
    id      => 2,
    name    => 'Anne',
},{
    id      => 3,
    name    => 'Frank'
});

my @list = map {
    {name => $_->{name}}
} @array;


use Data::Dumper;
print Dumper(@list);
for my $id (1..3) {
    my $name = $list[0]->{name};
    print "User $id: $name\n";
}
