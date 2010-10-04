# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit flag-o-matic

DESCRIPTION="Extract catalogs of sources from astronomical FITS images."
HOMEPAGE="http://gitorious.org/poloka/libsex"
SRC_URI="http://astrowww.phys.uvic.ca/~seb/${P}.tar.gz"

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
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS BUGS ChangeLog HISTORY README THANKS README.libsex
	CONFDIR=/usr/share/libsex
	insinto ${CONFDIR}
	doins config/* || die
	if use doc; then
		insinto /usr/share/doc/${PF}
		doins doc/* || die
	fi
}

pkg_postinst() {
	elog "libsex examples configuration files are located"
	elog "in ${CONFDIR} and are not loaded anymore by default."
}
