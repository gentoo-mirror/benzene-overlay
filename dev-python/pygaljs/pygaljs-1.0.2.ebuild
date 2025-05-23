# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{{10..13},13t} )

inherit distutils-r1 pypi

DESCRIPTION="Python package providing assets from https://github.com/Kozea/pygal.js"
HOMEPAGE="https://github.com/ionelmc/python-pygaljs"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_tests pytest
