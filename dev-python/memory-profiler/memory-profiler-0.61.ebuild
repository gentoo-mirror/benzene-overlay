# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{{10..13},13t} )

inherit distutils-r1

MY_P=memory_profiler-${PV}
DESCRIPTION="A module for monitoring memory usage of a python program"
HOMEPAGE="
	https://github.com/pythonprofilers/memory_profiler/
	https://pypi.org/project/memory-profiler/
"
SRC_URI="
	https://github.com/pythonprofilers/memory_profiler/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~riscv x86 ~amd64-linux ~x86-linux"
IUSE="examples"

# dev-lang/mercury: collision on 'mprof'
# https://bugs.gentoo.org/571176
RDEPEND="
	dev-python/psutil[${PYTHON_USEDEP}]
	!dev-lang/mercury
"

distutils_enable_tests pytest

python_test() {
	"${EPYTHON}" -m memory_profiler test/test_as.py || die
	"${EPYTHON}" -m memory_profiler test/test_func.py || die
	"${EPYTHON}" -m memory_profiler test/test_gen.py || die
	"${EPYTHON}" -m memory_profiler test/test_loop.py || die
	"${EPYTHON}" -m memory_profiler test/test_loop_decorated.py || die
	"${EPYTHON}" -m memory_profiler test/test_mprofile.py || die
	"${EPYTHON}" -m memory_profiler test/test_nested.py || die
	"${EPYTHON}" -m memory_profiler test/test_precision_command_line.py || die
	"${EPYTHON}" -m memory_profiler test/test_unicode.py || die

	"${EPYTHON}" test/test_exception.py || die
	"${EPYTHON}" test/test_exit_code.py || die
	"${EPYTHON}" test/test_global.py || die
	"${EPYTHON}" test/test_import.py || die
	"${EPYTHON}" test/test_memory_usage.py || die
	"${EPYTHON}" test/test_mprof.py || die
	"${EPYTHON}" test/test_precision_import.py || die
	"${EPYTHON}" test/test_stream_unicode.py || die
	"${EPYTHON}" test/test_tracemalloc.py || die
}

python_install_all() {
	use examples && dodoc -r examples

	distutils-r1_python_install_all
}
