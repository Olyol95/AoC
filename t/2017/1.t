#!/usr/bin/env perl

use Test::More tests => 10;

require_ok( 'AoC::2017::DayOne' );

my $solution = AoC::2017::DayOne->new;

ok( $solution->part_1('1122')     eq '3',  'p1_t1' );
ok( $solution->part_1('1111')     eq '4',  'p1_t2' );
ok( $solution->part_1('1234')     eq '0',  'p1_t3' );
ok( $solution->part_1('91212129') eq '9',  'p1_t4' );

ok( $solution->part_2('1212')     eq '6',  'p2_t1' );
ok( $solution->part_2('1221')     eq '0',  'p2_t2' );
ok( $solution->part_2('123425')   eq '4',  'p2_t3' );
ok( $solution->part_2('123123')   eq '12', 'p2_t4' );
ok( $solution->part_2('12131415') eq '4',  'p2_t5' );
