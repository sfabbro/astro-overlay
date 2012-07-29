# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Spectral Adaptive Lightcurve Template instruments and models"
HOMEPAGE="http://supernovae.in2p3.fr/~guy/salt/"
SNFIT_DATA="salt2_model_data-2-0
	SNLS3-Landolt-model
	SNLS3-Megacam-model
	SNLS3-Keplercam
	SNLS3-4Shooter2
	SNLS3-SDSS-model-Doi2010
	SNLS3-CSP-Swope
	SNLS3-HST-ACSWF
	SNLS3-HST-NICMOS2
	SNLS3-magsys-1
	SNLS3-SDSS-magsys
	SNLS3-Vega-magsys"

for d in ${SNFIT_DATA}; do
	SRC_URI="${SRC_URI} ${HOMEPAGE}/download/${d}.tar.gz"
done

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=""
DEPEND=""

RESTRICT="mirror"

S="${WORKDIR}"

src_prepare() {
	cat <<-EOF > fitmodel.card
		@SALT2 salt2-2-0
		@STANDARD Instruments/SNLS3-Landolt-model
		@MEGACAM Instruments/SNLS3-Megacam-model
		@KEPLERCAM Instruments/Keplercam
		@4SHOOTER2 Instruments/4Shooter2
		@SDSS Instruments/SDSS
		@SWOPE Instruments/Swope
		@ACSWF Instruments/ACSWF
		@NICMOS2 Instruments/NICMOS2
		@VEGA MagSys/BD17-snls3.dat
		@SDSS-AB-off MagSys/SDSS-AB-off.dat
		@VEGAHST MagSys/Vega0.dat
	EOF
	mkdir -p Instruments
	mv SNLS* Keplercam 4Shooter2 SDSS Swope ACSWF NICMOS2 Instruments/
}

src_install() {
	insinto /usr/share/snfit
	doins -r *
}
