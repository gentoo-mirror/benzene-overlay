# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Python module to generate ATOM feeds, RSS feeds and Podcasts"
HOMEPAGE="https://feedgen.kiesow.be"

LICENSE="BSD-2 LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 "
IUSE="doc"

RDEPEND=">=dev-python/lxml-4.2.5[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
"

distutils_enable_tests nose

python_install_all() {
	dodoc readme.rst
	use doc && HTML_DOCS=( docs/html/. )

	distutils-r1_python_install_all
}