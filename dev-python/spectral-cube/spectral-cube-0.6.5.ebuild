# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi virtualx

DESCRIPTION="Library for reading and analyzing astrophysical spectral data cubes"
HOMEPAGE="https://spectral-cube.readthedocs.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"	# no x86 KEYWORD for yt, glueviz
IUSE="doc intersphinx noviz viz viz_extra"
RESTRICT="intersphinx? ( network-sandbox )"
REQUIRED_USE="intersphinx? ( doc )"

RDEPEND=">=dev-python/numpy-1.8[${PYTHON_USEDEP}]
	dev-python/astropy[${PYTHON_USEDEP}]
	dev-python/casa-formats-io[${PYTHON_USEDEP}]
	dev-python/dask[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	>=dev-python/radio-beam-0.3.3[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	noviz? (
		dev-python/distributed[${PYTHON_USEDEP}]
		dev-python/fsspec[${PYTHON_USEDEP}]
		>=dev-python/reproject-0.9.1[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/zarr[${PYTHON_USEDEP}]
	)
	viz? (
		dev-python/aplpy[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/reproject[${PYTHON_USEDEP}]
	)
"
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]
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
		dev-python/zarr[${PYTHON_USEDEP}]
		dev-qt/qtsvg:5
	)
"
PDEPEND="noviz? ( dev-python/pvextractor[${PYTHON_USEDEP}] )
	viz? ( dev-python/pvextractor[${PYTHON_USEDEP}] )
	viz_extra? (
		dev-python/glue-qt[${PYTHON_USEDEP}]
		dev-python/yt[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/glue-qt[${PYTHON_USEDEP}]
		dev-python/pvextractor[${PYTHON_USEDEP}]
		dev-python/yt[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
#distutils_enable_sphinx docs dev-python/sphinx-astropy

python_compile_all() {
	if use doc; then
		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/install/$(python_get_sitedir) \
			emake "SPHINXOPTS=$(usex intersphinx '' '-D disable_intersphinx=1')" -C docs html
		HTML_DOCS=( docs/_build/html/. )
	fi
}

python_test() {
	virtx epytest
}
