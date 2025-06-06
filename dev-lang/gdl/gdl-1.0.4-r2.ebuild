# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WX_GTK_VER="3.2-gtk3"
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake flag-o-matic python-r1 toolchain-funcs virtualx wxwidgets

DESCRIPTION="GNU Data Language"
HOMEPAGE="https://github.com/gnudatalanguage/gdl"
SRC_URI="https://github.com/gnudatalanguage/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+eigen fftw glpk graphicsmagick gshhs hdf hdf5 +imagemagick netcdf
	openmp png proj postscript python shapelib tiff udunits wxwidgets
"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	dev-cpp/antlr-cpp:2=
	dev-libs/expat
	media-libs/libpng:=
	net-libs/libtirpc:=
	sci-libs/gsl:=
	sci-libs/plplot:=[X,cxx,-dynamic,wxwidgets?]
	sys-libs/ncurses:=
	sys-libs/readline:=
	sys-libs/zlib
	x11-libs/libX11
	fftw? ( sci-libs/fftw:3.0= )
	glpk? ( sci-mathematics/glpk:= )
	gshhs? (
		sci-geosciences/gshhs-data
		sci-geosciences/gshhs:=
	)
	hdf? ( sci-libs/hdf:= )
	hdf5? ( sci-libs/hdf5:= )
	imagemagick? (
		!graphicsmagick? ( media-gfx/imagemagick:=[cxx] )
		graphicsmagick? ( media-gfx/graphicsmagick:=[cxx] )
	)
	netcdf? ( sci-libs/netcdf:= )
	proj? ( sci-libs/proj:= )
	postscript? ( dev-libs/pslib )
	python? (
		${PYTHON_DEPS}
		dev-python/numpy[${PYTHON_USEDEP}]
	)
	shapelib? ( sci-libs/shapelib:= )
	tiff? (
		media-libs/tiff:=
		sci-libs/libgeotiff:=
	)
	udunits? ( sci-libs/udunits )
	wxwidgets? ( x11-libs/wxGTK:${WX_GTK_VER}=[X] )
"
DEPEND="${RDEPEND}
	eigen? ( dev-cpp/eigen:3 )
"
BDEPEND="
	virtual/pkgconfig
	python? ( app-admin/chrpath )
"

PATCHES=( "${FILESDIR}"/${PN}-1.0.4-cmake.patch )
DOCS=( AUTHORS HACKING NEWS PYTHON.txt README README.md )

S="${WORKDIR}/${PN}-v${PV}"

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_prepare() {
	use wxwidgets && setup-wxwidgets unicode
	use hdf5 && has_version sci-libs/hdf5[mpi] && export CXX=mpicxx

	# remove bundled antlr
	rm -r src/antlr || die

	# gentoo: avoid install files in datadir directory
	# and manually install them in src_install
	sed -e '/AUTHORS/d' -i CMakeLists.txt || die

	cmake_src_prepare
}

src_configure() {
	# -Werror=strict-aliasing
	# https://bugs.gentoo.org/930966
	# https://github.com/gnudatalanguage/gdl/issues/1852
	#
	# Do not trust with LTO either.
	append-flags -fno-strict-aliasing
	filter-lto

	# MPI is still very buggy
	# x11=off does not compile
	local mycmakeargs=(
		-DMPI=OFF
		-DREADLINE=ON
		-DX11=ON
		-DEXPAT=ON
		-DPNGLIB=ON
		-DEIGEN3=$(usex eigen)
		-DFFTW=$(usex fftw)
		-DGRIB=OFF
		-DGLPK=$(usex glpk)
		-DHDF=$(usex hdf)
		-DHDF5=$(usex hdf5)
		-DLIBPROJ=$(usex proj)
		-DNETCDF=$(usex netcdf)
		-DOPENMP=$(usex openmp)
		-DPNGLIB=$(usex png)
		-DUDUNITS2=$(usex udunits)
		-DWXWIDGETS=$(usex wxwidgets)
		-DGRAPHICSMAGICK=$(usex imagemagick $(usex graphicsmagick))
		-DMAGICK=$(usex imagemagick $(usex !graphicsmagick))
		-DTIFF=$(usex tiff)
		-DGEOTIFF=$(usex tiff)
		-DSHAPELIB=$(usex shapelib)
		-DQHULL=OFF
	)

	configuration() {
		mycmakeargs+=( "$@" )
		cmake_src_configure
	}
	configuration -DPYTHON_MODULE=OFF -DPYTHON=OFF
	use python && python_foreach_impl configuration -DPYTHON_MODULE=ON -DPYTHON=ON \
		-DPython_EXECUTABLE=/usr/bin/python$(python -c "import sys; print('.'.join(map(str, sys.version_info[:2])))")
}

src_compile() {
	cmake_src_compile
	use python && python_foreach_impl cmake_src_compile
}

src_test() {
	virtx cmake_src_test
}

src_install() {
	cmake_src_install
	if use python; then
		installation() {
			chrpath -d src/GDL.so || die
			python_domodule src/GDL.so
		}
		python_foreach_impl run_in_build_dir installation
		dodoc PYTHON.txt
	fi

	newenvd - 50gdl <<-_EOF_
		GDL_PATH="+${EPREFIX}/usr/share/gnudatalanguage"
	_EOF_
}
