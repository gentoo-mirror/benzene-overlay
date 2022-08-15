# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Library for reading and analyzing astrophysical spectral data cubes"
HOMEPAGE="https://spectral-cube.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc intersphinx novis all"
# Test phase runs with fails
RESTRICT="test
	intersphinx? ( network-sandbox )"
REQUIRED_USE="all? ( novis )
	intersphinx? ( doc )"

RDEPEND=">=dev-python/numpy-1.8[${PYTHON_USEDEP}]
	dev-python/astropy[${PYTHON_USEDEP}]
	dev-python/casa-formats-io[${PYTHON_USEDEP}]
	dev-python/dask[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	>=dev-python/radio-beam-0.3.3[${PYTHON_USEDEP}]
	novis? (
		dev-python/distributed[${PYTHON_USEDEP}]
		dev-python/fsspec[${PYTHON_USEDEP}]
		dev-python/regions[${PYTHON_USEDEP}]
		dev-python/reproject[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/zarr[${PYTHON_USEDEP}]
	)
	all? (
		dev-python/aplpy[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
	)
"
BDEPEND="dev-python/setuptools_scm[${PYTHON_USEDEP}]
	doc? (
		${RDEPEND}
		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/pytest-astropy-header[${PYTHON_USEDEP}]
		dev-python/aplpy[${PYTHON_USEDEP}]
		dev-python/bottleneck[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/regions[${PYTHON_USEDEP}]
		dev-python/reproject[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/zarr[${PYTHON_USEDEP}]
	)
"
#PDEPEND="novis? ( dev-python/pvextractor[${PYTHON_USEDEP}] )
#		all? (
#			dev-python/glue-core[${PYTHON_USEDEP}]
#			dev-python/yt[${PYTHON_USEDEP}]
#		)
#		test? (
#			dev-python/glue-core[${PYTHON_USEDEP}]
#		)
#"
##			dev-python/pvextractor[${PYTHON_USEDEP}]

PATCHES=( "${FILESDIR}/${P}-fix-old-regions-api.patch" )

distutils_enable_tests pytest
#distutils_enable_sphinx docs dev-python/sphinx-astropy

python_compile_all() {
	if use doc; then
		pushd docs || die
		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/install/$(python_get_sitedir) \
			emake "SPHINXOPTS=$(usex intersphinx '' '-D disable_intersphinx=1')" html
		popd || die
		HTML_DOCS=( docs/_build/html/. )
	fi
}
