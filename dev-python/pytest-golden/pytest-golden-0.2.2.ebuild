# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Plugin for pytest that offloads expected outputs to data files"
HOMEPAGE="https://github.com/oprypin/pytest-golden"
SRC_URI="https://github.com/oprypin/pytest-golden/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND=">=dev-python/pytest-6.1.2[${PYTHON_USEDEP}]
	>=dev-python/atomicwrites-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.16.12[${PYTHON_USEDEP}]
	>=dev-python/testfixtures-6.15.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
