# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="Python module to parse ds9 region file"
HOMEPAGE="http://pyregion.readthedocs.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=">=dev-python/numpy-1.16[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	>=dev-python/astropy-4.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.0[${PYTHON_USEDEP}]
"
BDEPEND="${DEPEND}
	>=dev-python/setuptools-scm-6.2[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-automodapi dev-python/sphinx-rtd-theme dev-python/matplotlib

python_compile_all() {
	use doc && { cp "${BUILD_DIR}"/install/$(python_get_sitedir)/${PN}/*.cpython*so ${PN} || die ; }

	sphinx_compile_all
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		docinto examples
		dodoc -r examples/.
	fi

	distutils-r1_python_install_all
}

python_test() {
	epytest "${BUILD_DIR}"
}

pkg_postinst() {
	optfeature "plotting support" dev-python/matplotlib
}
