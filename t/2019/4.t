#!/usr/bin/env perl

use Test::More tests => 7;

require_ok( 'AoC::2019::DayFour' );

my $solution = AoC::2019::DayFour->new;

ok($solution->_is_eligible('111111'), 'p1_t1');
ok(!$solution->_is_eligible('223450'), 'p1_t2');
ok(!$solution->_is_eligible('123789'), 'p1_t3');

ok($solution->_has_double_digit('112233', 'p2_t1'));
ok(!$solution->_has_double_digit('123444', 'p2_t2'));
ok($solution->_has_double_digit('111122', 'p2_t3'));
