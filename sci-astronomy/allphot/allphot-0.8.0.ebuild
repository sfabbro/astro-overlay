# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Bash library and tools to wrap and automate ALLFRAME"
HOMEPAGE="http://github.com/sfabbro/allphot"
SRC_URI="http://astrowww.phys.uvic.ca/~seb/allphot/${P}.tar.gz"

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="sci-libs/cfitsio
	sci-astronomy/allframe
	|| (
		sys-apps/coreutils
		sys-freebsd/freebsd-bin
		app-misc/realpath
	)"
RDEPEND="${DEPEND}"
