#!perl
requires 'Carp';
requires 'perl', '5.010';
requires 'strict';
requires 'warnings';

on configure => sub {
    requires 'ExtUtils::MakeMaker::CPANfile';
    requires 'Pod::Text';
};

on test => sub {
    requires 'Test::More', '0.88';
};

# vim: ft=perl
