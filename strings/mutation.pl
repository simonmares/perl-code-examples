#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use utf8;

# get substring
my $monument = "Arc de Triomphe de l\'Étoile";
my $arch_de_triomphe = substr($monument, 0, length('Arc de Triomphe'));
is $arch_de_triomphe, 'Arc de Triomphe';
is substr($monument, 0, 3), 'Arc';
is substr($monument, 0), $monument, 'implicit length is size of string (-1)';
is substr($monument, length($arch_de_triomphe)+1), "de l\'Étoile";

# mutate string in place
substr($arch_de_triomphe, 0, 3) = 'Ark';
is $arch_de_triomphe, 'Ark de Triomphe', 'replaced with assignment';
substr($arch_de_triomphe, 0, 3, 'Archway');
is $arch_de_triomphe, 'Archway de Triomphe', 'replaced by string with different length';

no strict;
$slovo = "Pchjongjang";
$f = (substr($slovo, 3, 4) = "XXX");
print $slovo;#PchXXXjang
print $f;#XXXj
print "\n";

done_testing();
