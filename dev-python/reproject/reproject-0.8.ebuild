# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Reproject astronomical images with Python"
HOMEPAGE="https://reproject.readthedocs.io"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	doc? ( http://data.astropy.org/galactic_center/gc_2mass_k.fits
		http://data.astropy.org/galactic_center/gc_msx_e.fits
		http://data.astropy.org/allsky/ligo_simulated.fits.gz
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=135&name=ki1350080.fits -> ki1350080.fits
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=135&name=ki1350092.fits -> ki1350092.fits
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=142&name=ki1420186.fits -> ki1420186.fits
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=142&name=ki1420198.fits -> ki1420198.fits
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=143&name=ki1430080.fits -> ki1430080.fits
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=143&name=ki1430092.fits -> ki1430092.fits
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=144&name=ki1440186.fits -> ki1440186.fits
		https://irsa.ipac.caltech.edu:443/cgi-bin/2MASS/IM/nph-im?ds=asky&atdir=/ti05&dh=990502s&scan=144&name=ki1440198.fits -> ki1440198.fits
	)
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc intersphinx"
RESTRICT="intersphinx? ( network-sandbox )"
REQUIRED_USE="intersphinx? ( doc )"

RDEPEND=">=dev-python/astropy-3.2[${PYTHON_USEDEP}]
	>=dev-python/astropy-healpix-0.6[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools_scm[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/extension-helpers[${PYTHON_USEDEP}]
	doc? (
		${RDEPEND}
		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
		dev-python/pyvo[${PYTHON_USEDEP}]
	)
	test? (
		${RDEPEND}
		dev-python/pytest-astropy[${PYTHON_USEDEP}]
		sci-libs/shapely[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}"/0002-${PN}-0.7.1-doc-use-local-fits.patch
)

distutils_enable_tests pytest
#distutils_enable_sphinx docs dev-python/sphinx-astropy dev-python/pyvo

python_prepare_all() {
	use doc && { cp "${DISTDIR}"/*.fits* "${S}"/docs || die ; }

	distutils-r1_python_prepare_all
}

python_compile_all() {
	if use doc; then
		pushd docs || die
		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/install/$(python_get_sitedir) \
			emake "SPHINXOPTS=$(usex intersphinx '' '-D disable_intersphinx=1')" html
		popd || die
		HTML_DOCS=( docs/_build/html/. )
	fi
}

python_test() {
	epytest "${BUILD_DIR}"/install/$(python_get_sitedir)
}
