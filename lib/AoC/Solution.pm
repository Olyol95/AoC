package AoC::Solution;

use Moose;

use Carp;

has 'verbose' => (
    isa => 'Int',
    is  => 'ro',
    default => sub { $ENV{VERBOSE} ? 1 : 0 },
);

sub part_1 {
    confess "Not implemented!";
}

sub part_2 {
    confess "Not implemented!";
}

__PACKAGE__->meta->make_immutable;

1;

__END__
