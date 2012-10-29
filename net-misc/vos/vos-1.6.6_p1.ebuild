# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MYP="${P/_p/a}"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="CADC VOSpace Filesystem"
HOMEPAGE="https://github.com/ijiraq/cadcVOFS"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MYP}.tar.gz"

SLOT="0"
LICENSE="AGPL-3"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}
	dev-python/setuptools"

S="${WORKDIR}/${MYP}"
