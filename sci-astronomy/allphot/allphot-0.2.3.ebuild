# Copyright 1999-2010 CANFAR
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Bash library and tools to wrap and automate ALLFRAME"
HOMEPAGE=""
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RESTRICT=fetch
DEPEND=""
RDEPEND="${DEPEND}
	sci-astronomy/allframe"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README ChangeLog NEWS AUTHORS TODO
}
