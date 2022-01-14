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
    [ 'hex',  '0xdead1234beef',  'tupot-damuh-ruroz' ],
    [ 'hex',  'ffffffff',        'zuzuz-zuzuz' ],
    [ 'hex',  '0xffffffff',      'zuzuz-zuzuz' ],
    [ 'hex',  '0000',            'babab' ],
    [ 'hex',  '0001',            'babad' ],
    [ 'ip',   '63.84.220.193',   'gutih-tugad' ],
    [ 'ip',   '63.118.7.35',     'gutuk-bisog' ],
    [ 'ip',   '140.98.193.141',  'mudof-sakat' ],
    [ 'ip',   '64.255.6.200',    'haguz-biram' ],
    [ 'ip',   '128.30.52.45',    'mabiv-gibot' ],
    [ 'ip',   '147.67.119.2',    'natag-lisaf' ],
    [ 'ip',   '212.58.253.68',   'tibup-zujah' ],
    [ 'ip',   '216.35.68.215',   'tobog-higil' ],
    [ 'ip',   '216.68.232.21',   'todah-vobij' ],
    [ 'ip',   '198.81.129.136',  'sinid-makam' ],
    [ 'ip',   '12.110.110.204',  'budov-kuras' ],
    [ 'ip',   '0.0.0.1',         'babab-babad' ],
    [ 'ip',   '255.255.255.255', 'zuzuz-zuzuz' ],
    [ 'ip',   '::1',        'babab-babab-babab-babab-babab-babab-babab-babad' ],
    [ 'ip',   'dead::beef', 'tupot-babab-babab-babab-babab-babab-babab-ruroz' ],

    #    [ 'auto', 'lkjsdf',          'kudor-konug-kidok' ],
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
            is proquint2hex( $triplet->[PQ] ), $triplet->[SRC] =~ s/^0[xX]//r,
              'proquint2hex ' . $triplet->[PQ];
        }
        elsif ( $triplet->[TYPE] eq 'ip' ) {
            is ip2proquint( $triplet->[SRC] ), $triplet->[PQ],
              'ip2proquint ' . $triplet->[SRC];
            is proquint2ip( $triplet->[PQ] ), $triplet->[SRC],
              'proquint2ip ' . $triplet->[PQ];
        }
        else {
            bail_out( 'Invalid test type: ' . $triplet->[TYPE] );
        }
    }
}

done_testing();
