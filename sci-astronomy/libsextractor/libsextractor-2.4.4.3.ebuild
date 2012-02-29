# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic

DESCRIPTION="Extract catalogs of sources from astronomical FITS images"
HOMEPAGE="http://github.com/sfabbro/libsextractor"
SRC_URI="http://astrowww.phys.uvic.ca/~seb/poloka/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND=""
DEPEND="${RDEPEND}"

pkg_setup() {
	replace-flags -O[2-9] -O1
}

src_install () {
	default
	CONFDIR=/usr/share/libsex
	insinto ${CONFDIR}
	doins config/*
	if use doc; then
		insinto /usr/share/doc/${PF}
		doins doc/*
	fi
}

pkg_postinst() {
	elog "libsex examples configuration files are located"
	elog "in ${EROOT}${CONFDIR} and are not loaded anymore by default."
}
