# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python interface to CmdStan"
HOMEPAGE="https://cmdstanpy.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="all"
RESTRICT="test"	# Missing test data

RDEPEND=">=dev-python/numpy-1.21[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	all? ( dev-python/xarray[${PYTHON_USEDEP}] )
"
BDEPEND="test? ( dev-python/testfixtures[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# from test import CustomTestCase - ModuleNotFoundError: No module named 'test'
	test/test_generate_quantities.py
	test/test_install_cmdstan.py
	test/test_model.py
	test/test_sample.py
	test/test_utils.py
)
