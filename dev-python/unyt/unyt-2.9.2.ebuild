# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Handle, manipulate, and convert data with units in Python"
HOMEPAGE="https://unyt.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-python/numpy-1.17.5[${PYTHON_USEDEP}]
	>=dev-python/sympy-1.5[${PYTHON_USEDEP}]
"

BDEPEND="test? ( dev-python/matplotlib[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
distutils_enable_sphinx docs

python_prepare_all() {
	use doc && { ln -rs "${S}"/{docs/extensions/show_all_units.py,} || die ; }

	distutils-r1_python_prepare_all
}
