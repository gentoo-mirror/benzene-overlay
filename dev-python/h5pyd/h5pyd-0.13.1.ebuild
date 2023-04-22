# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

H5PY_EXPV="3.8.0"
H5PY_EXP_URI="https://raw.githubusercontent.com/h5py/h5py/${H5PY_EXPV}/examples"
COMMIT="463c960e1c4da7d1f3da33bcd7fdfb0e38133fea"

inherit distutils-r1

DESCRIPTION="h5py distributed - Python client library for HDF Rest API"
HOMEPAGE="https://github.com/HDFGroup/h5pyd"
SRC_URI="https://github.com/HDFGroup/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz
	doc? (
		${H5PY_EXP_URI}/bytesio.py -> h5py-${H5PY_EXPV}-e-bytesio.py
		${H5PY_EXP_URI}/swmr_inotify_example.py -> h5py-${H5PY_EXPV}-e-swmr_inotify_example.py
		${H5PY_EXP_URI}/swmr_multiprocess.py -> h5py-${H5PY_EXPV}-e-swmr_multiprocess.py
	)
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"
RESTRICT="test"	# need h5serv for testing

RDEPEND=">=dev-python/numpy-1.17.3[${PYTHON_USEDEP}]
	dev-python/adal[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
	dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]
	dev-python/msrestazure[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/requests-unixsocket[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/pkgconfig[${PYTHON_USEDEP}]"

S="${WORKDIR}/${PN}-${COMMIT}"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/furo

python_prepare_all() {
	use doc && { for epy in "${DISTDIR}"/*-e-*; do { cp ${epy} "${S}"/examples/${epy##*-e-} || die ; } ; done ; \
		sed -i -e "/GH/s/GH/GH\%s/" -e "/PR/s/PR/PR\%s/" docs/conf.py || die ; }
	use test && eapply "${FILESDIR}"/${PN}-0.10.3-fix-h5type-test.patch

	distutils-r1_python_prepare_all
}

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		docinto examples
		dodoc -r examples/.
	fi

	distutils-r1_python_install_all
}
