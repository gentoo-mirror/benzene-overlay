# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{{10..13},13t} )

inherit distutils-r1 pypi

DESCRIPTION="Pure Python implementation of the XZ file format with random access support"
HOMEPAGE="https://github.com/rogdham/python-xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_prepare_all() {
	# remove dep on pytest-cov
	sed -i -e "/--cov/d" pytest.ini || die

	distutils-r1_python_prepare_all
}

python_test() {
	epytest --generate-integration-files
}
