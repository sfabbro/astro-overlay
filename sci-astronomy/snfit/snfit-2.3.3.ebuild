# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils

DESCRIPTION="Spectral Adaptive Lightcurve Template"
HOMEPAGE="http://supernovae.in2p3.fr/~guy/salt/"
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="virtual/lapack
	sci-libs/cfitsio
	sci-astronomy/snfit-data"
DEPEND="${RDEPEND}
	dev-lang/cfortran
	dev-util/pkgconfig"

src_configure() {
	econf \
		--with-blas="$(pkg-config --libs blas)" \
		--with-lapack="$(pkg-config --libs lapack)"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS README
	echo "PATHMODEL=/usr/share/snfit" > 99snfit
	doenvd 99snfit || die
}
