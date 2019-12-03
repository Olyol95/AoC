package AoC::2019::DayTwo;

use Moose;

use Carp;
use Data::Dumper;

extends 'AoC::Solution';

has '_memory' => (
    is      => 'rw',
    isa     => 'ArrayRef[Int]',
    default => sub { [] },
);

sub part_1 {
    my ($self, $input) = @_;

    $self->_load_input($input->[0]);
    
    unless ($ENV{TEST}) {
        $self->_set_value(1, 12);
        $self->_set_value(2, 2);
    }
    
    warn( "Initial state: " . Dumper($self->_memory) ) if $self->verbose == 2;

    $self->_exec;

    warn( "Final state: " . Dumper($self->_memory) ) if $self->verbose == 2;

    return $self->_get_value(0);
}

sub part_2 {
    my ($self, $input) = @_;

    foreach my $noun (0..99) {
        foreach my $verb (0..99) {
            $self->_load_input($input->[0]);

            $self->_set_value(1, $noun);
            $self->_set_value(2, $verb);

            $self->_exec;

            if ($self->_get_value(0) == 19690720) {
                return 100 * $noun + $verb;
            }
        }
    }

    croak "Failed to find a combination resulting in 19690720";
}

sub _load_input {
    my ($self, $input) = @_;

    $self->_clear;

    my @int_stream = split(/,/, $input);
    for (my $idx = 0; $idx < @int_stream; $idx++) {
        $self->_set_value($idx, $int_stream[$idx]);
    }
}

sub _exec {
    my $self = shift;

    my $instr_ptr = 0;
    while (1) {
        my $opcode = $self->_get_value($instr_ptr);

        last if $opcode == 99;

        croak "Encountered unsupported opcode $opcode at $instr_ptr"
            unless ($opcode == 1 || $opcode == 2);

        my $arg1 = $self->_get_value(
            $self->_get_value(
                $instr_ptr + 1
            )
        );
        my $arg2 = $self->_get_value(
            $self->_get_value(
                $instr_ptr + 2
            )
        );
        my $dest = $self->_get_value(
            $instr_ptr + 3
        );

        if ($opcode == 1) {
            $self->_set_value($dest, $arg1 + $arg2);
        }
        elsif ($opcode == 2) {
            $self->_set_value($dest, $arg1 * $arg2);
        }

        $instr_ptr += 4;
    }
}

sub _get_value {
    my ($self, $idx) = @_;
    
    my $val = $self->_memory->[$idx];
    croak "Attempted to access an undefined value at index $idx"
        unless defined $val;

    return $val;
}

sub _set_value {
    my ($self, $idx, $value) = @_;

    $self->_memory->[$idx] = $value;
}

sub _clear {
    my $self = shift;

    $self->_memory([]);
}


__PACKAGE__->meta->make_immutable;

1;

__END__
