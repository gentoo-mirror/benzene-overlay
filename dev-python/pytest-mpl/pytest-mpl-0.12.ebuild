# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1 virtualx

DESCRIPTION="Pytest plugin to faciliate image comparison for matplotlib figures"
HOMEPAGE="https://github.com/matplotlib/pytest-mpl"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"
RESTRICT="!test? ( test )"	# Test phase runs with fails

RDEPEND="dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
"

DOCS=( CHANGES.md README.rst )

python_test() {
	echo "backend : Agg" > "${T}"/matplotlibrc || die
	MPLCONFIGDIR="${T}" virtx pytest -vv
}

python_install_all() {
	use examples && DOCS+=( images/ )
	distutils-r1_python_install_all
}
