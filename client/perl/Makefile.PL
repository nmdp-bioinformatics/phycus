=head1 NAME
 
Makefile.PL

=head1 AUTHOR     Mike Halagan <mhalagan@nmdp.org>
    
    Bioinformatics Scientist
    3001 Broadway Stree NE
    Minneapolis, MN 55413
    ext. 8225

=head1 LICENSE

    Copyright (c) 2016 National Marrow Donor Program (NMDP)

    This library is free software; you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 3 of the License, or (at
    your option) any later version.

    This library is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; with out even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
    License for more details.
 
    You should have received a copy of the GNU Lesser General Public License
    along with this library;  if not, write to the Free Software Foundation,
    Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA.

    > http://www.gnu.org/licenses/lgpl.html

=cut
use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on them.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME                => 'HFCuS',
    AUTHOR              => q{Mike Halagan <mhalagan@nmdp.org>},
    VERSION_FROM        => 'lib/WWW/SwaggerClient/Configuration.pm',
    ABSTRACT            => 'Client for interacting with HFCuS',
    ($eumm_version >= 6.3001
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Module::Find'       => 0,
        'URI::Query'      => 0,
        'Module::Runtime'     => 0,
        'JSON'       => 0,
        'LWP::UserAgent' => 0,
        'Moose::Role' => 0,
        'Class::Singleton' => 0,
        'Date::Parse' => 0,
        'Class::Accessor'       => 0
    },
    dist         => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean        => { FILES => 'HFCuS-*' },
);
