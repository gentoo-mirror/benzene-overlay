# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Pytest plugin for detecting file handles that were inadvertently left open at the end of unit tests"
HOMEPAGE="https://github.com/astropy/pytest-openfiles"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
RDEPEND="dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pytest-2.8[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/setuptools[$PYTHON_USEDEP]"

distutils_enable_tests pytest
