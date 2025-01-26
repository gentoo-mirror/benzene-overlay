# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.4

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..12} )

CRATES="
	adler2@2.0.0
	autocfg@1.4.0
	base64@0.21.7
	bitflags@1.3.2
	byteorder@1.5.0
	cdshealpix@0.7.3
	cfg-if@1.0.0
	colorous@1.0.14
	crc32fast@1.4.2
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	either@1.13.0
	fdeflate@0.3.6
	flate2@1.0.35
	heck@0.5.0
	indoc@2.0.5
	itertools@0.13.0
	itoa@1.0.13
	katex-doc@0.1.0
	libc@0.2.164
	log@0.4.22
	mapproj@0.3.0
	matrixmultiply@0.3.9
	memchr@2.7.4
	memoffset@0.9.1
	minimal-lexical@0.2.1
	miniz_oxide@0.8.0
	ndarray@0.16.1
	nom@7.1.3
	num-bigint@0.4.6
	num-complex@0.4.6
	num-integer@0.1.46
	num-iter@0.1.45
	num-rational@0.4.2
	num-traits@0.2.19
	num@0.4.3
	num_threads@0.1.7
	numpy@0.22.1
	once_cell@1.20.2
	png@0.17.14
	portable-atomic-util@0.2.3
	portable-atomic@1.9.0
	proc-macro2@1.0.92
	pyo3-build-config@0.22.6
	pyo3-ffi@0.22.6
	pyo3-macros-backend@0.22.6
	pyo3-macros@0.22.6
	pyo3@0.22.6
	quick-error@2.0.1
	quote@1.0.37
	rawpointer@0.2.1
	rayon-core@1.12.1
	rayon@1.10.0
	rustc-hash@1.1.0
	ryu@1.0.18
	serde@1.0.215
	serde_derive@1.0.215
	serde_json@1.0.133
	simd-adler32@0.3.7
	slab@0.4.9
	stc-s@0.1.0
	syn@2.0.89
	target-lexicon@0.12.16
	thiserror-impl@1.0.69
	thiserror@1.0.69
	unicode-ident@1.0.14
	unindent@0.2.3
"

declare -A GIT_CRATES=(
	[moc]='https://github.com/cds-astro/cds-moc-rust;f252c2ea3f66cef60e501c2beca2977c439236f8;cds-moc-rust-%commit%'
)

inherit cargo distutils-r1

DESCRIPTION="MOC parsing and manipulation in Python"
HOMEPAGE="https://cds-astro.github.io/mocpy"
SRC_URI="https://github.com/cds-astro/mocpy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
LICENSE="BSD"
# Dependent crate licenses
LICENSE+=" Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="astropy_regions doc examples intersphinx query_fits"
PROPERTIES="test_network"
RESTRICT="test
	intersphinx? ( network-sandbox )"
REQUIRED_USE="intersphinx? ( doc )"

RDEPEND="dev-python/astropy[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	>=dev-python/cdshealpix-0.6.4[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.5[${PYTHON_USEDEP}]
	astropy_regions? ( dev-python/regions[${PYTHON_USEDEP}] )
	query_fits? ( dev-python/requests[${PYTHON_USEDEP}] )
"
BDEPEND="doc? (
		${RDEPEND}
		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
		dev-python/sphinx-collections[${PYTHON_USEDEP}]
		dev-python/sphinx-copybutton[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}]
		dev-python/nbsphinx[${PYTHON_USEDEP}]
		dev-python/astropy-healpix[${PYTHON_USEDEP}]
		virtual/pandoc
	)
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/regions[${PYTHON_USEDEP}]
	)
"
#BDEPEND="doc? ( virtual/pandoc )

distutils_enable_tests pytest
#distutils_enable_sphinx docs dev-python/sphinx-astropy \
#	dev-python/sphinx-collections \
#	dev-python/sphinx-copybutton \
#	dev-python/sphinxcontrib-bibtex \
#	dev-python/nbsphinx \
#	dev-python/astropy-healpix

python_prepare_all() {
	cat > "${S}"/Cargo.lock <<-EOF || die
		[[package]]
		name = "moc"
		version = "0.17.0"
		source = "git+https://github.com/cds-astro/cds-moc-rust?rev=f252c2ea3f66cef60e501c2beca2977c439236f8#f252c2ea3f66cef60e501c2beca2977c439236f8"
	EOF
#	sed -e '/"source":/s|../||' -e '/"target":/s|note|docs/note|' -i docs/conf.py || die

	distutils-r1_python_prepare_all
}

python_compile_all() {
	if use doc; then
		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/install/$(python_get_sitedir) \
			emake "SPHINXOPTS=$(usex intersphinx '' '-D disable_intersphinx=1')" -C docs html
		HTML_DOCS=( docs/_build/html/. )
	fi
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/notebooks"
		docinto notebooks
		dodoc -r notebooks/.
	fi

	distutils-r1_python_install_all
}

python_test() {
	epytest "${BUILD_DIR}"
}
