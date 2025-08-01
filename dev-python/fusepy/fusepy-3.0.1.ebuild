# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{{11..14},{13..14}t} )
#PYTHON_COMPAT=( python3_{{11..12},{13..14}{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Simple ctypes bindings for FUSE"
HOMEPAGE="https://github.com/fusepy/fusepy"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"	# No usable test phases

DEPEND="sys-fs/fuse:0"
RDEPEND="${DEPEND}"

#distutils_enable_tests nose
