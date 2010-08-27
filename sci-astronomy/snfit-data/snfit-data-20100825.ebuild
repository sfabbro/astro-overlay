# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Spectral Adaptive Lightcurve Template instruments and models"
HOMEPAGE="http://supernovae.in2p3.fr/~guy/salt/"
SRC_URI="salt2_model_data-2-0.tar.gz
	SNLS3-Landolt-model.tar.gz
	SNLS3-Megacam-model.tar.gz
	SNLS3-magsys.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND=""
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	cat <<-EOF >> fitmodel.card
		@SALT2 salt2-2-0
		@STANDARD Instruments/SNLS3-Landolt-model
		@MEGACAM Instruments/SNLS3-Megacam-model
		@VEGA MagSys/BD17-snls3.dat
	EOF
	mkdir -p Instruments
	mv SNLS* MagSys Instruments/
}

src_install() {
	insinto /usr/share/snfit
	doins -r * || die
}
