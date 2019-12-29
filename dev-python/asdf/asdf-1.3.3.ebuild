# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1 eutils

DESCRIPTION="Python library for the Advanced Scientific Data Format"
HOMEPAGE="https://asdf.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/numpy-1.6[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	<dev-python/semantic_version-2.8[${PYTHON_USEDEP}]
"
BDEPEND="<dev-python/astropy-helpers-3[${PYTHON_USEDEP}]
	doc? (
		${RDEPEND}
		dev-python/sphinx[${PYTHON_USEDEP}]
		<dev-python/astropy-3[${PYTHON_USEDEP}]
	)
	test? (
		${RDEPEND}
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}"/${P}-Disable-test-that-require-http-server.patch
)

distutils_enable_tests setup.py

python_prepare_all() {
	# use system astropy-helpers instead of bundled one
	sed -i -e '/auto_use/s/True/False/' setup.cfg || die
	distutils-r1_python_prepare_all
}

python_compile_all() {
	if use doc; then
		python_setup
		PYTHONPATH="${BUILD_DIR}"/lib \
			esetup.py build_docs --no-intersphinx
	fi
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "Support for units, time, transform, wcs, or running the tests"	dev-python/astropy
}
