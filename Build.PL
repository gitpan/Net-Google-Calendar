use strict;
use Module::Build;



my $requires = {
    'LWP::UserAgent'       => 0,
    'XML::Atom'            => '0.37',
    'Test::More'           => 0,
    'DateTime'             => 0,
    'URI'                  => 0,
    'URI::Escape'          => 0,
    'Net::Google::AuthSub' => 0,
};

$requires->{'Net::SSLeay'} = 0 unless _installed('Net::SSLeay') or _installed('Crypt::SSLeay');



my $build = Module::Build
  ->new( module_name  => "Net::Google::Calendar",
         license      => 'perl',
         script_files => [ ],
         requires     => $requires,
         recommended  => {
                          'Data::ICal'        => '0.07',
                        },
         create_makefile_pl => 'traditional',
       );

$build->create_build_script;

sub _installed {
    my $module = shift;
    eval "require $module;";
    return !$@;
}

