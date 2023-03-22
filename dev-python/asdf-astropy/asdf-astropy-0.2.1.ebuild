# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}

DESCRIPTION="ASDF serialization support for astropy"
HOMEPAGE="https://github.com/astropy/asdf-astropy"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc intersphinx"
# test failed for astropy>=5.1
#RESTRICT="test
RESTRICT="intersphinx? ( network-sandbox )"
REQUIRED_USE="intersphinx? ( doc )"

RDEPEND=">=dev-python/asdf-2.8.0[${PYTHON_USEDEP}]
	dev-python/asdf-coordinates-schemas[${PYTHON_USEDEP}]
	>=dev-python/asdf_transform_schemas-0.2.2[${PYTHON_USEDEP}]
	>=dev-python/astropy-5.0.4[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/importlib_resources-3[${PYTHON_USEDEP}]
	' python3_8)
	>=dev-python/packaging-16.0[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	doc? (
		${RDEPEND}
		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/pytest-remotedata[${PYTHON_USEDEP}]
		dev-python/pytest-astropy-header[${PYTHON_USEDEP}]
		<dev-python/astropy-5.1[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	)
"

S="${WORKDIR}/${MY_P}"

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
