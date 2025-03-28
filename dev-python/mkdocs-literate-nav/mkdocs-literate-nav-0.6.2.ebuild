# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="MkDocs plugin to specify the navigation in Markdown instead of YAML"
HOMEPAGE="https://oprypin.github.io/mkdocs-literate-nav"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-python/mkdocs-1.4.1[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/pytest-golden[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
