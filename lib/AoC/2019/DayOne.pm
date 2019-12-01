package AoC::2019::DayOne;

use Moose;

use POSIX qw(floor);

extends 'AoC::Solution';

sub part_1 {
    my ($self, $input) = @_;
    
    my $total = 0;
    $total += $self->_fuel_required($_) foreach @$input;

    return $total;
}

sub _fuel_required {
    my ($self, $mass) = @_;

    return floor($mass / 3.0) - 2;
}

sub part_2 {
    my ($self, $input) = @_;
    
    my $total = 0;
    $total += $self->_fuel_required_inc_fuel($_) foreach @$input;

    return $total;
}

sub _fuel_required_inc_fuel {
    my ($self, $mass) = @_;
    
    my $total = 0;
    my $additional_fuel = $self->_fuel_required($mass);
    while ($additional_fuel > 0) {
        $total += $additional_fuel;
        $additional_fuel = $self->_fuel_required($additional_fuel);
    }

    return $total;
}


__PACKAGE__->meta->make_immutable;

1;

__END__
