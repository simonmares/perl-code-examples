package Builder;
use Moose;

has "content" => (
    is => "rw",
    isa => "Str"
);

sub add_block($$) {
    my ($self, $block) = @_;
    $self->content($block);
}

# module loaded
return 1;
