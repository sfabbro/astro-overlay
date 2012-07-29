# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic

DESCRIPTION="Extract catalogs of sources from astronomical FITS images"
HOMEPAGE="http://github.com/sfabbro/libsextractor"
SRC_URI="http://astrowww.phys.uvic.ca/~seb/poloka/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc static-libs"

RDEPEND=""
DEPEND="${RDEPEND}"

pkg_setup() {
	replace-flags -O[2-9] -O1
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install () {
	default
	CONFDIR=/usr/share/${PN}
	insinto ${CONFDIR}
	doins config/*
	use doc && dodoc doc/*
}

pkg_postinst() {
	elog "${PN} configuration files are located in:"
	elog "${EROOT}${CONFDIR} and are not loaded anymore by default."
}
