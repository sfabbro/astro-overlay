# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils

DESCRIPTION="Astronomical data processing library geared towards optical supernova surveys"
HOMEPAGE="http://gitorious.org/poloka"
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cernlib imagemagick snfit"
RDEPEND="sci-astronomy/libsex
	sci-libs/cfitsio
	virtual/lapack
	cernlib? ( sci-physics/cernlib )
	imagemagick? ( media-gfx/imagemagick )
	snfit? ( sci-astronomy/snfit )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	econf \
		--with-blas="$(pkg-config --libs blas)" \
		--with-lapack="$(pkg-config --libs lapack)" \
		--without-static-cernlib \
		$(use_enable cernlib) \
		$(use_enable imagemagick) \
		$(use_enable snfit mc)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS README
	echo DBCONFIG=/usr/share/poloka > 99poloka
	echo TOADSCARDS=/usr/share/poloka/datacards >> 99poloka
	doenvd 99poloka
}
