package ExportModule;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw/ @ok_array /;

our $ok_scalar = 'ok';
our @ok_array = ('ok', 'still ok');
our %ok_hash = (-ok => 'ok');

our $not_scalar = 'not exported';
sub not_sub {'not exported'};

sub ok_sub {
    return 'ok';
}
