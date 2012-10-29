# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Tools to automate ALLFRAME"
HOMEPAGE="http://github.com/sfabbro/allphot"
SRC_URI="http://astrowww.phys.uvic.ca/~seb/allphot/${P}.tar.gz"

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

IUSE=""

DEPEND="sci-libs/cfitsio
	>=sci-astronomy/allframe-4.1.2
	sys-devel/bc
	|| (
		sys-apps/coreutils
		sys-freebsd/freebsd-bin
		app-misc/realpath
	)"
RDEPEND="${DEPEND}"
