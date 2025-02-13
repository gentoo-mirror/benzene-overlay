# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.4

EAPI=8

if [[ ${PV} != *9999 ]]; then
	CRATES="
		ansi_term@0.12.1
		arrayvec@0.7.6
		atty@0.2.14
		bitflags@1.3.2
		clap@2.34.0
		crossbeam-channel@0.5.14
		crossbeam-deque@0.8.6
		crossbeam-epoch@0.9.18
		crossbeam-utils@0.8.21
		either@1.13.0
		fuchsia-cprng@0.1.1
		hermit-abi@0.1.19
		hermit-abi@0.3.9
		humansize@1.1.1
		itoa@1.0.14
		libc@0.2.169
		num-format@0.4.4
		num_cpus@1.16.0
		rand@0.4.6
		rand_core@0.3.1
		rand_core@0.4.2
		rayon-core@1.12.1
		rayon@1.10.0
		rdrand@0.4.0
		remove_dir_all@0.5.3
		strsim@0.8.0
		tempdir@0.3.7
		term_size@0.3.2
		textwrap@0.11.0
		unicode-width@0.1.14
		vec_map@0.8.2
		winapi-i686-pc-windows-gnu@0.4.0
		winapi-x86_64-pc-windows-gnu@0.4.0
		winapi@0.3.9
		${P}
	"
fi

inherit cargo

DESCRIPTION="A minimal, fast alternative to 'du -sh'."
HOMEPAGE="https://github.com/sharkdp/diskus"

if [[ ${PV} == *9999 ]]; then
	EGIT_REPO_URI="https://github.com/sharkdp/${PN}.git"
	inherit git-r3

	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}
else
	SRC_URI="${CARGO_CRATE_URIS}"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi
LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" ISC MIT"
SLOT="0"

RDEPEND="${DEPEND}"

#QA_FLAGS_IGNORED="usr/bin/${PN}"

src_install() {
	cargo_src_install
	einstalldocs
}
