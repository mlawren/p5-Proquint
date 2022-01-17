#!perl
#
if ( $^O eq 'MSWin32' ) {
    requires 'perl' => '5.30.1';
}
else {
    requires perl => '5.13.2';
}

requires 'strict';
requires 'warnings';
requires 'Carp';
requires 'Exporter::Tiny';
requires 'Socket' => '2.022';

on configure => sub {
    requires 'ExtUtils::MakeMaker::CPANfile';
};

on develop => sub {
    requires 'App::githook_perltidy' => '0.11.10';
};

on test => sub {
    requires 'Test2::V0';
};

# vim: ft=perl
