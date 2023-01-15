# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=no
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Python version of the SGP4 satellite position library"
HOMEPAGE="https://github.com/brandon-rhodes/python-sgp4"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"	# Test phase runs with fails

BDEPEND="test? ( dev-python/numpy[${PYTHON_USEDEP}] )"

distutils_enable_tests nose
