# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Draws ASCII trees in Python"
HOMEPAGE="https://github.com/mbr/asciitree"
SRC_URI="https://github.com/mbr/asciitree/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-readable-theme
