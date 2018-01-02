#!perl
use Test2::V0;
use Proquint ':all';

my $hex   = '7f000001';
my $int   = hex( '0x' . $hex );
my $quint = 'lusab-babad';

my $hex2   = 'dead1234beef';
my $quint2 = 'tupot-damuh-ruroz';

is uint32quint($int),   $quint, 'uint32quint ' . $int;
is quint32uint($quint), $int,   'quint32uint ' . $quint;

is hex2quint($hex),   $quint, 'hex2quint ' . $hex;
is quint2hex($quint), $hex,   'quint2hex ' . $quint;

is hex2quint($hex2),   $quint2, 'hex2quint ' . $hex2;
is quint2hex($quint2), $hex2,   'quint2hex ' . $quint2;

done_testing();
