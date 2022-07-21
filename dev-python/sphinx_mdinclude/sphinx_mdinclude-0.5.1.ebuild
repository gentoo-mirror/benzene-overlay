# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Markdown extension for Sphinx"
HOMEPAGE="https://sphinx-mdinclude.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-python/mistune-2.0[${PYTHON_USEDEP}]
	<dev-python/docutils-0.19[${PYTHON_USEDEP}]
"
BDEPEND="test? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

PATCHES=( "${FILESDIR}/${P}-fix-changlog-highlight.patch" )

distutils_enable_tests pytest
distutils_enable_sphinx docs
