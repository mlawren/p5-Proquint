#!perl
use Test2::V0;
use Proquint ':all';

use constant TYPE => 0;
use constant SRC  => 1;
use constant PQ   => 2;

my @triplets = (
    [ 'uint', hex('0x7f000001'), 'lusab-babad' ],
    [ 'uint', hex('0xffffffff'), 'zuzuz-zuzuz' ],
    [ 'hex',  'dead1234beef',    'tupot-damuh-ruroz' ],
    [ 'hex',  'ffffffff',        'zuzuz-zuzuz' ],
    [ 'hex',  '0000',            'babab' ],
);

foreach my $triplet (@triplets) {
    subtest "@$triplet" => sub {
        if ( $triplet->[TYPE] eq 'uint' ) {
            is uint32proquint( $triplet->[SRC] ), $triplet->[PQ],
              'uint32proquint ' . $triplet->[SRC];
            is proquint32uint( $triplet->[PQ] ), $triplet->[SRC],
              'proquint32uint ' . $triplet->[PQ];
        }
        elsif ( $triplet->[TYPE] eq 'hex' ) {
            is hex2proquint( $triplet->[SRC] ), $triplet->[PQ],
              'hex2proquint ' . $triplet->[SRC];
            is proquint2hex( $triplet->[PQ] ), $triplet->[SRC],
              'proquint2hex ' . $triplet->[PQ];
        }
        else {
            bail_out( 'Invalid test type: ' . $triplet->[TYPE] );
        }
    }
}

done_testing();
