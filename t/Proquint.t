#!perl
use Test2::V0;
use Proquint ':all';

my $hex   = '7f000001';
my $int   = hex( '0x' . $hex );
my $quint = 'lusab-babad';

is uint32quint($int),   $quint, 'uint32quint';
is quint32uint($quint), $int,   'quint32uint';

is hex2quint($hex),   $quint, 'hex2quint';
is quint2hex($quint), $hex,   'quint2hex';

done_testing();
