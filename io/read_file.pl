use Test::More;

sub load($) {
  my $filename = shift;
  my $file_handler;
  open $file_handler, "<", $filename or die "Couldn't open $filename for reading because: $!";
  my $contents = "";
  while(my $line = <$file_handler>) {
    $contents .= $line;
  }
  close $file_handler;
  return $contents;
}

is load './text', "Hello P.E.R.L.";

done_testing();
