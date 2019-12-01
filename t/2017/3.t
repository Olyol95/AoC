#!/usr/bin/env perl

use Test::More tests => 5;

require_ok( 'AoC::2017::DayThree' );

my $solution = AoC::2017::DayThree->new;

ok( $solution->part_1(['1'])    eq '0',  'p1_t1' );
ok( $solution->part_1(['12'])   eq '3',  'p1_t2' );
ok( $solution->part_1(['23'])   eq '2',  'p1_t3' );
ok( $solution->part_1(['1024']) eq '31', 'p1_t4' );
