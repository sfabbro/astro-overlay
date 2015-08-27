# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="CADC VOSpace Filesystem"
HOMEPAGE="https://www.canfar.net/vos"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="AGPL-3"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

S="${WORKDIR}/${P}"

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
