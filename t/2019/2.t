#!/usr/bin/env perl

use Test::More tests => 5;

require_ok( 'AoC::2019::DayTwo' );

my $solution = AoC::2019::DayTwo->new;

is( $solution->part_1(['1,0,0,0,99']),          '2',  'p1_t1' );
is( $solution->part_1(['2,3,0,3,99']),          '2',  'p1_t2' );
is( $solution->part_1(['2,4,4,5,99,0']),        '2',  'p1_t3' );
is( $solution->part_1(['1,1,1,4,99,5,6,0,99']), '30', 'p1_t4' );
