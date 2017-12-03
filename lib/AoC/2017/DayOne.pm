package AoC::2017::DayOne;

use Moose;

extends 'AoC::Solution';

sub part_1 {
    my ($self, $input) = @_;
    
    my $count = 0;
    my @digits = split( //, $input->[0] );

    for (my $index = 0; $index < @digits; $index++) {
        my $prev_index = $index ? $index - 1 : scalar(@digits) - 1;
        my $digit = $digits[$index];
        if ($digits[$prev_index] == $digit) {
            $count += $digit;
        }
    }

    return $count;
}

sub part_2 {
    my ($self, $input) = @_;

    my $count = 0;
    my @digits = split( //, $input->[0] );

    my $step = @digits / 2;
    for (my $index = 0; $index < @digits; $index ++) {
        my $prev_index = $index < $step ? 
            scalar(@digits) - ($step - $index)
            : $index - $step;
        my $digit = $digits[$index];
        if ($digits[$prev_index] == $digit) {
            $count += $digit;
        }
    }

    return $count;
}

__PACKAGE__->meta->make_immutable;

1;

__END__
