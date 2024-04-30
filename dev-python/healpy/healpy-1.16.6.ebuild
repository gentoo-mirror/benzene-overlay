# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for healpix"
HOMEPAGE="https://healpy.readthedocs.io"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
PROPERTIES="test_network"
RESTRICT="test"

DEPEND=">=dev-python/numpy-1.25[${PYTHON_USEDEP}]
	>=sci-astronomy/healpix-3.82:=[cxx]
	>=sci-libs/cfitsio-4.1.0:=
	sci-libs/libsharp:=
"
RDEPEND="${DEPEND}
	dev-python/astropy[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
"
BDEPEND=">=dev-python/cython-3[${PYTHON_USEDEP}]
	>=dev-python/setuptools-scm-6.2[${PYTHON_USEDEP}]
	virtual/pkgconfig
	test? (
		dev-python/pytest-cython[${PYTHON_USEDEP}]
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
"

DOCS=( README.rst CHANGELOG.rst CITATION )

distutils_enable_tests pytest

python_test() {
	epytest "${BUILD_DIR}"
}
