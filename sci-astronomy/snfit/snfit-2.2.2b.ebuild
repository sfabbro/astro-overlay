# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils autotools

DESCRIPTION="Spectral Adaptive Lightcurve Template"
HOMEPAGE="http://supernovae.in2p3.fr/~guy/salt/"
SRC_URI="${HOMEPAGE}download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="virtual/lapack
	sci-libs/cfitsio
	>=sci-astronomy/snfit-data-20110205"
DEPEND="${RDEPEND}
	dev-lang/cfortran
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${P}-autotools.patch
	eautoreconf
}

src_configure() {
	econf \
		--with-blas="$(pkg-config --libs blas)" \
		--with-lapack="$(pkg-config --libs lapack)"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS README
	echo "PATHMODEL=${EROOT}/usr/share/snfit" > 99snfit
	doenvd 99snfit || die
}
