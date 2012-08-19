#!perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;

{package myOutputRole; use strict; use warnings;
    use Moo::Role;
    use MooX::Options;
    option 'output' => (is => 'ro', format => 's', required => 1, short => 'o');
    1;
}

{package myVerboseRole; use strict; use warnings;
 use Moo::Role;
 use MooX::Options;
 option 'verbose' => (is => 'ro', short => 'v', repeatable => 1);
 1;
}


{package myOpt; use strict; use warnings;
use Moo;
use MooX::Options flavour => [qw( pass_through )], protect_argv => 0, skip_options => [qw/verbose/];
with 'myOutputRole', 'myVerboseRole';
1;
}

my $opt = myOpt->new_with_options;
say "Output : ", $opt->output;
say "Verbose: ", $opt->verbose // 0;
say Dumper \@ARGV;
