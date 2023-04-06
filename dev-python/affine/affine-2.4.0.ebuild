# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Matrices describing affine transformation of the plane"
HOMEPAGE="https://github.com/rasterio/affine"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_tests pytest
