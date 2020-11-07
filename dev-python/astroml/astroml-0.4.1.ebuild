# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1 virtualx eutils

MY_PN=astroML
MY_P=${MY_PN}-${PV}

DESCRIPTION="Python Machine Learning library for astronomy"
HOMEPAGE="http://www.astroml.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="examples test"
#RESTRICT="network-sandbox"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/astropy-1.2[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.8[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.11[${PYTHON_USEDEP}]
	>=sci-libs/scikits_learn-0.18[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		${RDEPEND}
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
	)
"

S="${WORKDIR}/${MY_P}"

DOCS=( CHANGES.rst README.rst )

#distutils_enable_tests pytest

python_test() {
	virtx pytest "${MY_PN}"
}

python_install_all() {
	distutils-r1_python_install_all
	insinto /usr/share/doc/${PF}
	use examples && doins -r examples
}

pkg_postinst() {
	optfeature "Provides an interface to the HEALPix pixelization scheme, as well as fast spherical harmonic transforms"	dev-python/healpy
}
