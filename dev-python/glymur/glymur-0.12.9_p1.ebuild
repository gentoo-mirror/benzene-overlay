# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="d0134123978678d33573d53a144ce1634e770e10"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Tools for accessing JPEG2000 files"
HOMEPAGE="https://glymur.readthedocs.org"
SRC_URI="https://github.com/quintusdias/glymur/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
BDEPEND="test? (
		sci-libs/gdal[python]
		sci-libs/scikit-image[${PYTHON_USEDEP}]
		media-libs/openjpeg:2
	)
"

S="${WORKDIR}/${PN}-${COMMIT}"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source dev-python/numpydoc dev-python/sphinx-rtd-theme

python_prepare_all() {
	use doc && { mkdir docs/source/_static || die ; }
	distutils-r1_python_prepare_all
}
