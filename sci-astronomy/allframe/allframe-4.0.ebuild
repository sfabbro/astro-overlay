# Copyright 1999-2010 CANFAR
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Stellar photometry software"
HOMEPAGE=""
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc"

DEPEND="sci-libs/cfitsio[fortran]"
RDEPEND="${DEPEND}"

RESTRICT=fetch

src_prepare() {
	epatch "${FILESDIR}"/${P}-comments.patch
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README NEWS AUTHORS ChangeLog
	if use doc; then
		insinto /usr/share/doc/${PF}
		doins doc/* || die
	fi
}
