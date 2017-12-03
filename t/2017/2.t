#!/usr/bin/env perl

use Test::More tests => 3;

require_ok( 'AoC::2017::DayTwo' );

my $solution = AoC::2017::DayTwo->new;

ok( $solution->part_1([
    '5	1	9	5',
    '7	5	3',
    '2	4	6	8',
]) eq '18', 'p1_t1' );

ok( $solution->part_2([
    '5	9	2	8',
    '9	4	7	3',
    '3	8	6	5',
]) eq '9',  'p2_t1' );
