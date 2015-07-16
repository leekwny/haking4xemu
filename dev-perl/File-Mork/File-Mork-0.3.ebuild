# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.16.4

EAPI="5"

MODULE_AUTHOR="SIMONW"


inherit perl-module

DESCRIPTION="A module to read Mozilla URL history files File::Mork::Entry - an single entry in a mork DB"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/HTML-Parser
	|| ( virtual/perl-Module-Build dev-perl/Module-Build )
	dev-lang/perl"
