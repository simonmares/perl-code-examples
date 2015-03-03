#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my @wonders = ('Taj Mahal', 'Giza Necropolis', 'Petra', 'Colosseum');

# , 'Chichen Itza', 'Machu Picchu', 'Great Wall of China', 'Christ de Redeemer');
local $" = " -- ";
is "@wonders", 'Taj Mahal -- Giza Necropolis -- Petra -- Colosseum';

done_testing();
