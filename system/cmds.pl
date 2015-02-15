use Test::More;
my $text = `ls -1 .`;
is $text, "cmds.pl\n";

done_testing;