#!perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;

{package myOpt;
use strict;
use warnings;
use Moo;
use MooX::Options flavour => [qw( pass_through )], protect_argv => 0;

option 'output' => (is => 'ro', format => 's', required => 1, short => 'o');
1;
}

my $opt = myOpt->new_with_options;
say "Output : ", $opt->output;
say Dumper \@ARGV;
