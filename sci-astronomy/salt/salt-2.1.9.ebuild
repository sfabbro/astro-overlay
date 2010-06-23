# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils autotools

MYP=snfit-${PV}
DESCRIPTION="Spectral Adaptive Lightcurve Template"
HOMEPAGE="http://supernovae.in2p3.fr/~guy/salt/"

SRC_URI="${MYP}.tar.gz
	snfit_data_19_1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="virtual/lapack
	sci-libs/cfitsio"
DEPEND="${RDEPEND}
	dev-lang/cfortran
	dev-util/pkgconfig"

S="${WORKDIR}/${MYP}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc44.patch
	epatch "${FILESDIR}"/${P}-autotools.patch
	AT_M4DIR="m4" eautoreconf
	rm -f src/cfortran.h
}

src_configure() {
	econf \
		--with-blas="$(pkg-config --libs blas)" \
		--with-lapack="$(pkg-config --libs lapack)"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS README
	local salt_model=/usr/share/salt
	insinto ${salt_model}
	doins -r "${WORKDIR}"/snfit_data/*
	echo "PATHMODEL=${salt_model}" > 99salt
	doenvd 99salt || die
	rm -f "${D}"usr/include/minuit.h
}
