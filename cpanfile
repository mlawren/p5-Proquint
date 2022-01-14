#!perl
requires 'Carp';
requires 'Exporter::Tiny';
requires 'perl', '5.010';
requires Socket => '2.022';
requires 'strict';
requires 'warnings';

on configure => sub {
    requires 'ExtUtils::MakeMaker::CPANfile';
    requires 'Pod::Text';
};

on develop => sub {
    requires 'App::githook_perltidy' => '0.11.10';
};

on test => sub {
    requires 'Test2::V0';
};

# vim: ft=perl
