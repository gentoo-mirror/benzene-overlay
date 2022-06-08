# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Sphinx plugin for generating documentation from ASDF schemas"
HOMEPAGE="https://github.com/spacetelescope/sphinx-asdf"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/pyyaml[${PYTHON_USEDEP}]
	~dev-python/mistune-0.8.4[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/sphinx-bootstrap-theme[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools_scm[$PYTHON_USEDEP]"

distutils_enable_tests pytest
