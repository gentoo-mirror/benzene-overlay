# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Fast random access to zstd files"
HOMEPAGE="https://github.com/martinellimarco/indexed_zstd"
SRC_URI+=" test? ( https://github.com/martinellimarco/indexed_zstd/raw/v${PV}/test/test.zst -> ${P}-test.zst )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="app-arch/zstd"
BDEPEND="dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"

python_prepare_all() {
	use test && { cp {"${DISTDIR}"/${P}-,"${S}"/}test.zst || die ; }

	distutils-r1_python_prepare_all
}

python_test() {
	${EPYTHON} test/test.py || die "Tests failed with ${EPYTHON}"
}
