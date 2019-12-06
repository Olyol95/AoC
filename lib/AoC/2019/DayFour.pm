package AoC::2019::DayFour;

use Moose;

use Carp;

extends 'AoC::Solution';

sub part_1 {
    my ($self, $input) = @_;

    my $total = 0;

    my @lims = split(/-/, $input->[0]);
    for (my $pass = $lims[0]; $pass <= $lims[1]; $pass++) {
        $total++ if $self->_is_eligible($pass);
    }

    return $total;
}

sub part_2 {
    my ($self, $input) = @_;

    my $total = 0;

    my @lims = split(/-/, $input->[0]);
    for (my $pass = $lims[0]; $pass <= $lims[1]; $pass++) {
        if ($self->_is_eligible($pass)) {
            $total++ if (
                $self->_is_eligible($pass)
                && $self->_has_double_digit($pass)
            );
        }
    }

    return $total;
}

sub _is_eligible {
    my ($self, $pass) = @_;

    return $pass =~ /^\d{6}$/
        && $pass =~ /(\d)\1/
        && $self->_always_increases($pass);
}

sub _always_increases {
    my ($self, $pass) = @_;

    my $last;
    foreach my $digit (split(//, $pass)) {
        return 0 if ($last && $digit < $last);
        $last = $digit;
    }

    return 1;
}

sub _has_double_digit {
    my ($self, $pass) = @_;

    my %counts;
    foreach my $digit (split(//, $pass)) {
        $counts{$digit}++;
    }

    foreach my $count (values %counts) {
        return 1 if $count == 2;
    }
    return 0;
}

__PACKAGE__->meta->make_immutable;

1;

__END__
