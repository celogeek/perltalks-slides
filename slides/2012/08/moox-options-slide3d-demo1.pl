#!perl
use strict;
use warnings;
use feature 'say';

{package myOpt;
use strict;
use warnings;
use Moo;
use MooX::Options;

option 'verbose' => (is => 'ro', short => 'v', repeatable => 1);
1;
}

my $opt = myOpt->new_with_options;

say "I can't speak, my voice off." if !$opt->verbose;
say "I have a tiny voice." if $opt->verbose;
say "Oh wait, I can speak louder. Boo :)" if $opt->verbose && $opt->verbose > 1;
say "You will regret this. Yahhhhhhhhhhh, I speak too much." if $opt->verbose && $opt->verbose > 2;
