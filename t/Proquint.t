#!perl
use Test2::V0;
use Proquint ':all';

my $hex   = '7f000001';
my $int   = hex( '0x' . $hex );
my $quint = 'lusab-babad';

is uint32quint($int),   $quint, 'uint32quint';
is quint32uint($quint), $int,   'quint32uint';

is hexstr2quint($hex),   $quint, 'hexstr2quint';
is quint2hexstr($quint), $hex,   'quint2hexstr';

done_testing();
