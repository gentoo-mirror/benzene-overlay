# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1 virtualx optfeature

MY_PN=astroML
MY_P=${MY_PN}-${PV}

DESCRIPTION="Python Machine Learning library for astronomy"
HOMEPAGE="http://www.astroml.org"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"
RESTRICT="!test? ( test )"	# Test phase runs with fails

RDEPEND=">=dev-python/astropy-1.2[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.8[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.11[${PYTHON_USEDEP}]
	>=sci-libs/scikit-learn-0.18[${PYTHON_USEDEP}]
"
BDEPEND="test? (
		${RDEPEND}
		dev-python/pytest-astropy[${PYTHON_USEDEP}]
	)
"

S="${WORKDIR}/${MY_P}"

DOCS=( CHANGES.rst README.rst )

python_prepare_all() {
	cp "${FILESDIR}"/conftest.py "${S}/${MY_PN}" || die
	distutils-r1_python_prepare_all
}

python_test() {
	virtx pytest -vv "${BUILD_DIR}/lib"
}

python_install_all() {
	use examples && DOCS+=( examples/ )
	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "Provides an interface to the HEALPix pixelization scheme, as well as fast spherical harmonic transforms"	dev-python/healpy
}
