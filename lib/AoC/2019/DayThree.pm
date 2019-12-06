package AoC::2019::DayThree;

use Moose;

use Carp;

extends 'AoC::Solution';

sub part_1 {
    my ($self, $input) = @_;

    my ($x, $y) = $self->_closest_intersection(
        $self->_generate_coord_set($input->[0]),
        $self->_generate_coord_set($input->[1]),
    );

    return abs($x) + abs($y);
}

sub part_2 {
    my ($self, $input) = @_;
    
    my $line_1 = $self->_generate_coord_set($input->[0]);
    my $line_2 = $self->_generate_coord_set($input->[1]);

    my $intersections = $self->_get_intersections($line_1, $line_2);

    my $min_steps = 0;
    foreach my $point (@$intersections) {
        my ($x, $y) = @$point;
        my $steps = $line_1->{$x}->{$y} + $line_2->{$x}->{$y};
        $min_steps = $steps
            if ($min_steps == 0 || $steps < $min_steps);
    }

    return $min_steps;
}

sub _closest_intersection {
    my ($self, $line_1, $line_2) = @_;
    
    my $closest = [0, 0];
    my $intersections = $self->_get_intersections($line_1, $line_2);

    foreach my $point (@$intersections) {
        my $distance = abs($point->[0]) + abs($point->[1]);
        if (($closest->[0] == 0 && $closest->[1] == 0)
            || $distance < abs($closest->[0]) + abs($closest->[1])
        ) {
            $closest = $point;
        }
    }

    return @$closest;
}

sub _get_intersections {
    my ($self, $line_1, $line_2) = @_;

    my @intersections;

    foreach my $x (keys %$line_2) {
        foreach my $y (keys %{ $line_2->{$x} }) {
            next unless exists $line_1->{$x}->{$y};
            push @intersections, [$x, $y];
        }
    }

    return \@intersections;
}

sub _generate_coord_set {
    my ($self, $input) = @_;

    my $coords = {};
    my ($x, $y) = (0, 0);
    my $steps = 0;
    foreach my $instruction (split(/,/, $input)) {
        if ($instruction =~ /^U(\d+)$/) {
            my $lim = $y + $1;
            while ($y < $lim) {
                $y++;
                $steps++;
                $coords->{$x}->{$y} = $steps
                    unless exists $coords->{$x}->{$y};
            }
        }
        elsif ($instruction =~ /^D(\d+)$/) {
            my $lim = $y - $1;
            while ($y > $lim) {
                $y--;
                $steps++;
                $coords->{$x}->{$y} = $steps
                    unless exists $coords->{$x}->{$y};
            }
        }
        elsif ($instruction =~ /^L(\d+)$/) {
            my $lim = $x - $1;
            while ($x > $lim) {
                $x--;
                $steps++;
                $coords->{$x}->{$y} = $steps
                    unless exists $coords->{$x}->{$y};
            }
        }
        elsif ($instruction =~ /^R(\d+)$/) {
            my $lim = $x + $1;
            while ($x < $lim) {
                $x++;
                $steps++;
                $coords->{$x}->{$y} = $steps
                    unless exists $coords->{$x}->{$y};
            }
        }
        else {
            croak "Unrecognised instruction: $instruction";
        }
    }

    return $coords;
}


__PACKAGE__->meta->make_immutable;

1;

__END__
