# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1 optfeature

DESCRIPTION="Python library for the Advanced Scientific Data Format"
HOMEPAGE="https://asdf.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"
#RESTRICT="network-sandbox"	# To use intersphinx linking

RDEPEND=">=dev-python/numpy-1.10[${PYTHON_USEDEP}]
	<dev-python/jsonschema-4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	>=dev-python/semantic_version-2.8[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools_scm[${PYTHON_USEDEP}]
	doc? (
		${RDEPEND}
		media-gfx/graphviz
	)
	test? (
		${RDEPEND}
		dev-python/gwcs[${PYTHON_USEDEP}]
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/lz4[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs dev-python/sphinx-astropy dev-python/astropy

python_test() {
	pytest -vv "${BUILD_DIR}/lib" || die "Tests fail with ${EPYTHON}"
}

pkg_postinst() {
	optfeature "units, time, transform, wcs, or running the tests" ">=dev-python/astropy-3.0"
	optfeature "lz4 compression" ">=dev-python/lz4-0.10"
}
