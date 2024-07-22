# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="S-expressions for Numpy"
HOMEPAGE="https://github.com/mapbox/snuggs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.1.6[${PYTHON_USEDEP}]
"
BDEPEND="test? ( dev-python/hypothesis[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
