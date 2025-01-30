# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
#DISTUTILS_IN_SOURCE_BUILD is not supported in PEP517 mode
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{{10..13},13t} )

inherit distutils-r1 pypi xdg-utils

DESCRIPTION="Helpers for Astropy and Affiliated packages"
HOMEPAGE="https://astropy-helpers.readthedocs.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

PATCHES=( "${FILESDIR}/${P}-fix-importlib.patch" )

python_prepare() {
	sed -e "/astropy_helpers/s:astropy_helpers:$(python_get_sitedir)/astropy_helpers:" \
		-i "astropy_helpers/commands/build_sphinx.py" || die
	xdg_environment_reset
}
