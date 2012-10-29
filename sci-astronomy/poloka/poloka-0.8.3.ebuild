# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Astronomy processing library geared towards supernova surveys"
HOMEPAGE="http://github.com/sfabbro/poloka"
SRC_URI="http://astrowww.phys.uvic.ca/~seb/poloka/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="cernlib imagemagick snfit static-libs"
RDEPEND="sci-astronomy/libsextractor
	sci-libs/cfitsio
	virtual/lapack
	cernlib? ( sci-physics/cernlib )
	imagemagick? ( media-gfx/imagemagick )
	snfit? ( sci-astronomy/snfit )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf \
		--with-blas="$(pkg-config --libs blas)" \
		--with-lapack="$(pkg-config --libs lapack)" \
		--without-static-cernlib \
		$(use_enable cernlib) \
		$(use_enable imagemagick) \
		$(use_enable snfit mc) \
		$(use_enable static-libs static)
}

src_install() {
	default
	echo "DBCONFIG=${EROOT}/usr/share/poloka/dbconfig" > 99poloka
	echo "TOADSCARDS=${EROOT}/usr/share/poloka/datacards" >> 99poloka
	doenvd 99poloka
}
