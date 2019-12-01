package AoC::Solutions;

use Moose;

use Carp;
use Switch;

use AoC::2017::DayOne;
use AoC::2017::DayTwo;
use AoC::2017::DayThree;

use AoC::2019::DayOne;

has 'verbose' => (
    isa => 'Int',
    is  => 'ro',
    default => sub { $ENV{VERBOSE} ? 1 : 0 },
);

has 'solutions' => (
    isa     => 'HashRef[ArrayRef[AoC::Solution]]',
    is      => 'ro',
    default => sub { return { 2017 => [], 2019 => [], }; },
);

sub BUILD {
    my ($self, $args) = @_;

    push @{ $self->solutions->{2017} }, AoC::2017::DayOne->new;
    push @{ $self->solutions->{2017} }, AoC::2017::DayTwo->new;
    push @{ $self->solutions->{2017} }, AoC::2017::DayThree->new;

    push @{ $self->solutions->{2019} }, AoC::2019::DayOne->new;
}

sub solve {
    my ($self, $year, $day, $part, $input) = @_;

    if (exists $self->solutions->{$year}) {
        my @solutions = @{ $self->solutions->{$year} };
        if (@solutions >= $day) {
            switch( $part ) {
                case 1 {
                    return $solutions[$day - 1]->part_1(
                        $input
                    );
                }
                case 2 {
                    return $solutions[$day - 1]->part_2(
                        $input
                    );
                }
            }
        }
    }
    croak "No solution found for $year $day-$part";
}

__PACKAGE__->meta->make_immutable;

__END__
