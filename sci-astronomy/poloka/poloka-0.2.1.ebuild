# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils

DESCRIPTION="Library for astronomical image analysis focusing on photometry"
HOMEPAGE="http://gitorious.org/poloka"
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc minimal"
RDEPEND="virtual/lapack
	sci-libs/cfitsio"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	econf \
		--with-blas="$(pkg-config --libs blas)" \
		--with-lapack="$(pkg-config --libs lapack)" \
		$(use_enable !minimal sex) \
		$(use_enable !minimal psf) \
		$(use_enable !minimal sub) \
		$(use_enable !minimal simfit) \
		$(use_enable !minimal simphot)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS README
}
