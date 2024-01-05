# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Modern Text User Interface framework"
HOMEPAGE="https://textual.textualize.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND=">=dev-python/markdown-it-py-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.3.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
"
BDEPEND="test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/linkify-it-py[${PYTHON_USEDEP}]
		dev-python/tree-sitter-languages[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=python-textual
	tests/snapshot_tests/test_snapshots.py
)

python_test() {
	# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=python-textual
	epytest -k 'not textual_env_var'
}
