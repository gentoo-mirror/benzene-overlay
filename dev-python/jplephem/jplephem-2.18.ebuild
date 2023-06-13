# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="Python version of NASA DE4xx ephemerides"
HOMEPAGE="https://github.com/brandon-rhodes/python-jplephem"
SRC_URI+=" test? (
		https://github.com/brandon-rhodes/python-jplephem/raw/${PV}/ci/de405.bsp -> ${P}-de405.bsp
		https://github.com/brandon-rhodes/python-jplephem/raw/${PV}/ci/de421.bsp -> ${P}-de421.bsp
	)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"	# 1 test failed

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"

distutils_enable_tests nose

python_prepare_all() {
	use test && { for ebsp in "${DISTDIR}"/${P}*.bsp; do { cp ${ebsp} "${S}"/${ebsp##*-} || die ; } done }

	distutils-r1_python_prepare_all
}
