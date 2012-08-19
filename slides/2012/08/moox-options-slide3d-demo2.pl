#!perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;

{package myOpt;
use strict;
use warnings;
use Moo;
use MooX::Options;

option 'ids' => (is => 'ro', format => 'i', repeatable => 1,required => 1, autosplit => ',');
1;
}

my $opt = myOpt->new_with_options;
say Dumper $opt->ids;
