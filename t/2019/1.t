#!/usr/bin/env perl

use Test::More tests => 8;

require_ok( 'AoC::2019::DayOne' );

my $solution = AoC::2019::DayOne->new;

is( $solution->part_1(['12']),     '2',     'p1_t1' );
is( $solution->part_1(['14']),     '2',     'p1_t2' );
is( $solution->part_1(['1969']),   '654',   'p1_t3' );
is( $solution->part_1(['100756']), '33583', 'p1_t4' );

is( $solution->part_2(['14']),     '2',     'p2_t1' );
is( $solution->part_2(['1969']),   '966',   'p2_t2' );
is( $solution->part_2(['100756']), '50346', 'p2_t3' );
