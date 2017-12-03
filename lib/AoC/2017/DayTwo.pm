package AoC::2017::DayTwo;

use Moose;

extends 'AoC::Solution';

sub part_1 {
    my ($self, $input) = @_;
    
    my $checksum = 0;
    foreach my $line (@$input) {
        my @values = split( /\t/, $line );
        my $max = my $min = shift @values;
        foreach my $value (@values) {
            if ($value < $min) {
                $min = $value;
            }
            if ($value > $max) {
                $max = $value
            }
        }
        $checksum += $max - $min;
    }

    return $checksum;
}

sub part_2 {
    my ($self, $input) = @_;

    my $checksum = 0;
    foreach my $line (@$input) {
        my @values = split( /\t/, $line );
        OUTER: for (my $idx_1 = 0; $idx_1 < @values; $idx_1++) {
            my $val_1 = $values[$idx_1];
            for (my $idx_2 = 0; $idx_2 < @values; $idx_2++) {
                if ($idx_1 != $idx_2) {
                    my $val_2 = $values[$idx_2];
                    if ($val_1 % $val_2 == 0) {
                        $checksum += $val_1 / $val_2;
                        last OUTER;
                    }
                }
            }
        }
    }

    return $checksum;
}

__PACKAGE__->meta->make_immutable;

1;

__END__
