# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Astropy affiliated package for reducing optical/IR CCD data"
HOMEPAGE="https://ccdproc.readthedocs.io"
KEYWORDS="~amd64 ~x86"
#IUSE="doc intersphinx"
#RESTRICT="intersphinx? ( network-sandbox )
#	test"	# something wrong with test tempdir
#REQUIRED_USE="intersphinx? ( doc )"
RESTRICT="test"	# something wrong with test tempdir

LICENSE="BSD"
SLOT="0"

RDEPEND=">=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/astropy-5.0.1[${PYTHON_USEDEP}]
	dev-python/scikit-image[${PYTHON_USEDEP}]
	>=dev-python/astroscrappy-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/reproject-0.7[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-astropy-header[${PYTHON_USEDEP}]
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/pytest-remotedata[${PYTHON_USEDEP}]
		dev-python/memory-profiler[${PYTHON_USEDEP}]
	)
"
#	doc? (
#		${RDEPEND}
#		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
#		media-gfx/graphviz
#	)

distutils_enable_tests pytest
#distutils_enable_sphinx docs --no-autodoc

#python_prepare_all() {
#	use doc && eapply "${FILESDIR}"/${PN}-2.4.3-fix-underline-length.patch
#
#	distutils-r1_python_prepare_all
#}

#python_compile_all() {
#	if use doc; then
#		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/install/$(python_get_sitedir) \
#			emake "SPHINXOPTS=$(usex intersphinx '' '-D disable_intersphinx=1')" -C docs html
#		HTML_DOCS=( docs/_build/html/. )
#	fi
#}
