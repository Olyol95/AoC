package AoC::2017::DayThree;

use Moose;

use POSIX qw(ceil);

extends 'AoC::Solution';

sub part_1 {
    my ($self, $input) = @_;
    
    my $sp_idx = $input->[0];
    
    my $root = ceil(sqrt($sp_idx));
    my $cur_r = $root % 2 == 0 ? $root + 1 : $root;
    my $num_r = ($cur_r - 1) / 2;
    my $cycle = $sp_idx - (($cur_r - 2) ** 2);
    my $offset = $cycle % ($cur_r - 1);

    return $num_r + abs($offset - $num_r);
}

sub part_2 {
    my ($self, $input) = @_;

    my $sp_idx = $input->[0];

    my @memory;


}

sub _cart_to_idx {
    my ($self, $x, $y) = @_;

    my $max_idx;
    if (abs($x) > abs($y)) {
        $max_idx = ($x + 2) ** 2;
    }
    elsif (abs($y) > abs($x)) {
        $max_idx = ($y + 2) ** 2;
    }
    else {
        $max_idx = ($x + 2) ** 2;
    }
}

__PACKAGE__->meta->make_immutable;

1;

__END__
