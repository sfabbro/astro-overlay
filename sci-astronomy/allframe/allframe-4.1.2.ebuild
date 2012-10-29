# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit fortran-2

DESCRIPTION="Stellar photometry software"
HOMEPAGE="http://github.com/sfabbro/allframe"
SRC_URI="http://astrowww.phys.uvic.ca/~seb/allphot/${P}.tar.gz"

LICENSE="daophot-agreement"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

IUSE="doc"

DEPEND="sci-libs/cfitsio[fortran]"
RDEPEND="${DEPEND}"

src_install() {
	default
	use doc && dodoc doc/*
}
