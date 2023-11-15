# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

if [[ ${PV} != *9999 ]]; then
	CRATES="
		addr2line@0.21.0
		adler@1.0.2
		ahash@0.8.6
		aho-corasick@1.1.2
		ansi_term@0.12.1
		async-broadcast@0.5.1
		async-channel@2.1.0
		async-executor@1.6.0
		async-fs@1.6.0
		async-io@1.13.0
		async-io@2.2.0
		async-lock@2.8.0
		async-lock@3.1.0
		async-process@1.8.1
		async-recursion@1.0.5
		async-signal@0.2.5
		async-task@4.5.0
		async-trait@0.1.74
		atomic-waker@1.1.2
		atty@0.2.14
		autocfg@1.1.0
		backtrace@0.3.69
		base64@0.21.5
		bitflags@1.3.2
		bitflags@2.4.1
		block@0.1.6
		block-buffer@0.10.4
		blocking@1.5.1
		bumpalo@3.14.0
		byteorder@1.5.0
		bytes@1.5.0
		calloop@0.12.3
		calloop-wayland-source@0.2.0
		cc@1.0.84
		cfg-if@1.0.0
		clap@2.34.0
		clipboard-win@3.1.1
		clipboard-win@4.5.0
		concurrent-queue@2.3.0
		copypasta@0.10.0
		core-foundation@0.9.3
		core-foundation-sys@0.8.4
		cpufeatures@0.2.11
		crossbeam-utils@0.8.16
		crypto-common@0.1.6
		cssparser@0.31.2
		cssparser-macros@0.6.1
		cursor-icon@1.1.0
		deranged@0.3.9
		derivative@2.2.0
		derive_more@0.99.17
		digest@0.10.7
		dirs-next@2.0.0
		dirs-sys-next@0.1.2
		dlib@0.5.2
		downcast-rs@1.2.0
		dtoa@1.0.9
		dtoa-short@0.3.4
		ego-tree@0.6.2
		either@1.9.0
		encoding_rs@0.8.33
		endian-type@0.1.2
		enumflags2@0.7.8
		enumflags2_derive@0.7.8
		env_logger@0.10.1
		equivalent@1.0.1
		errno@0.3.6
		error-code@2.3.1
		event-listener@2.5.3
		event-listener@3.1.0
		event-listener-strategy@0.3.0
		fastrand@1.9.0
		fastrand@2.0.1
		fd-lock@3.0.13
		fnv@1.0.7
		foreign-types@0.3.2
		foreign-types-shared@0.1.1
		form_urlencoded@1.2.0
		futf@0.1.5
		futures-channel@0.3.29
		futures-core@0.3.29
		futures-io@0.3.29
		futures-lite@1.13.0
		futures-lite@2.0.1
		futures-sink@0.3.29
		futures-task@0.3.29
		futures-util@0.3.29
		fxhash@0.2.1
		generic-array@0.14.7
		gethostname@0.3.0
		getopts@0.2.21
		getrandom@0.2.11
		gimli@0.28.0
		h2@0.3.21
		hashbrown@0.12.3
		hashbrown@0.14.2
		heck@0.3.3
		hermit-abi@0.1.19
		hermit-abi@0.3.3
		hex@0.4.3
		home@0.5.5
		html5ever@0.26.0
		htmlescape@0.3.1
		http@0.2.11
		http-body@0.4.5
		httparse@1.8.0
		httpdate@1.0.3
		humantime@2.1.0
		hyper@0.14.27
		hyper-rustls@0.24.2
		hyper-tls@0.5.0
		idna@0.4.0
		indexmap@1.9.3
		indexmap@2.1.0
		instant@0.1.12
		io-lifetimes@1.0.11
		ipnet@2.9.0
		is-terminal@0.4.9
		itoa@1.0.9
		js-sys@0.3.65
		lazy-bytes-cast@5.0.1
		lazy_static@1.4.0
		libc@0.2.150
		libloading@0.8.1
		libredox@0.0.1
		linux-raw-sys@0.3.8
		linux-raw-sys@0.4.11
		lock_api@0.4.11
		log@0.4.20
		mac@0.1.1
		mac-notification-sys@0.6.1
		malloc_buf@0.0.6
		markup5ever@0.11.0
		md-5@0.10.6
		memchr@2.6.4
		memmap2@0.9.0
		memoffset@0.7.1
		mime@0.3.17
		minimal-lexical@0.2.1
		miniz_oxide@0.7.1
		mio@0.8.9
		native-tls@0.2.11
		new_debug_unreachable@1.0.4
		nibble_vec@0.1.0
		nix@0.26.4
		nix@0.27.1
		nom@7.1.3
		notify-rust@4.9.0
		num_cpus@1.16.0
		objc@0.2.7
		objc-foundation@0.1.1
		objc_id@0.1.1
		object@0.32.1
		once_cell@1.18.0
		openssl@0.10.59
		openssl-macros@0.1.1
		openssl-probe@0.1.5
		openssl-sys@0.9.95
		ordered-stream@0.2.0
		parking@2.2.0
		parking_lot@0.12.1
		parking_lot_core@0.9.9
		percent-encoding@2.3.0
		phf@0.10.1
		phf@0.11.2
		phf_codegen@0.10.0
		phf_generator@0.10.0
		phf_generator@0.11.2
		phf_macros@0.11.2
		phf_shared@0.10.0
		phf_shared@0.11.2
		pin-project-lite@0.2.13
		pin-utils@0.1.0
		piper@0.2.1
		pkg-config@0.3.27
		polling@2.8.0
		polling@3.3.0
		powerfmt@0.2.0
		ppv-lite86@0.2.17
		precomputed-hash@0.1.1
		proc-macro-crate@1.3.1
		proc-macro-error@1.0.4
		proc-macro-error-attr@1.0.4
		proc-macro2@1.0.69
		quick-xml@0.30.0
		quote@1.0.33
		radix_trie@0.2.1
		rand@0.8.5
		rand_chacha@0.3.1
		rand_core@0.6.4
		redox_syscall@0.4.1
		redox_users@0.4.4
		regex@1.10.2
		regex-automata@0.4.3
		regex-syntax@0.8.2
		reqwest@0.11.22
		ring@0.17.5
		rustc-demangle@0.1.23
		rustix@0.37.27
		rustix@0.38.22
		rustls@0.21.8
		rustls-pemfile@1.0.4
		rustls-webpki@0.101.7
		rustyline-with-newest-nix@12.0.0
		ryu@1.0.15
		schannel@0.1.22
		scoped-tls@1.0.1
		scopeguard@1.2.0
		scraper@0.18.1
		sct@0.7.1
		security-framework@2.9.2
		security-framework-sys@2.9.1
		selectors@0.25.0
		serde@1.0.192
		serde_derive@1.0.192
		serde_json@1.0.108
		serde_repr@0.1.17
		serde_urlencoded@0.7.1
		servo_arc@0.3.0
		sha1@0.10.6
		signal-hook-registry@1.4.1
		siphasher@0.3.11
		slab@0.4.9
		smallvec@1.11.2
		smithay-client-toolkit@0.18.0
		smithay-clipboard@0.7.0
		socket2@0.4.10
		socket2@0.5.5
		spin@0.9.8
		stable_deref_trait@1.2.0
		static_assertions@1.1.0
		str-buf@1.0.6
		string_cache@0.8.7
		string_cache_codegen@0.5.2
		strsim@0.8.0
		structopt@0.3.26
		structopt-derive@0.4.18
		strum@0.22.0
		strum_macros@0.22.0
		syn@1.0.109
		syn@2.0.39
		system-configuration@0.5.1
		system-configuration-sys@0.5.0
		tauri-winrt-notification@0.1.3
		tempfile@3.8.1
		tendril@0.4.3
		termcolor@1.4.0
		textwrap@0.11.0
		thiserror@1.0.50
		thiserror-impl@1.0.50
		time@0.3.30
		time-core@0.1.2
		tinyvec@1.6.0
		tinyvec_macros@0.1.1
		tokio@1.34.0
		tokio-native-tls@0.3.1
		tokio-rustls@0.24.1
		tokio-socks@0.5.1
		tokio-util@0.7.10
		toml_datetime@0.6.5
		toml_edit@0.19.15
		tower-service@0.3.2
		tracing@0.1.40
		tracing-attributes@0.1.27
		tracing-core@0.1.32
		try-lock@0.2.4
		typenum@1.17.0
		uds_windows@1.0.2
		unicode-bidi@0.3.13
		unicode-ident@1.0.12
		unicode-normalization@0.1.22
		unicode-segmentation@1.10.1
		unicode-width@0.1.11
		untrusted@0.9.0
		url@2.4.1
		utf-8@0.7.6
		utf8parse@0.2.1
		vcpkg@0.2.15
		vec_map@0.8.2
		version_check@0.9.4
		waker-fn@1.1.1
		want@0.3.1
		wasi@0.11.0+wasi-snapshot-preview1
		wasm-bindgen@0.2.88
		wasm-bindgen-backend@0.2.88
		wasm-bindgen-futures@0.4.38
		wasm-bindgen-macro@0.2.88
		wasm-bindgen-macro-support@0.2.88
		wasm-bindgen-shared@0.2.88
		wayland-backend@0.3.2
		wayland-client@0.31.1
		wayland-csd-frame@0.3.0
		wayland-cursor@0.31.0
		wayland-protocols@0.31.0
		wayland-protocols-wlr@0.2.0
		wayland-scanner@0.31.0
		wayland-sys@0.31.1
		web-sys@0.3.65
		webpki-roots@0.25.2
		winapi@0.3.9
		winapi-i686-pc-windows-gnu@0.4.0
		winapi-util@0.1.6
		winapi-wsapoll@0.1.1
		winapi-x86_64-pc-windows-gnu@0.4.0
		windows@0.24.0
		windows@0.51.1
		windows-core@0.51.1
		windows-sys@0.48.0
		windows-targets@0.48.5
		windows_aarch64_gnullvm@0.48.5
		windows_aarch64_msvc@0.48.5
		windows_i686_gnu@0.24.0
		windows_i686_gnu@0.48.5
		windows_i686_msvc@0.24.0
		windows_i686_msvc@0.48.5
		windows_x86_64_gnu@0.24.0
		windows_x86_64_gnu@0.48.5
		windows_x86_64_gnullvm@0.48.5
		windows_x86_64_msvc@0.24.0
		windows_x86_64_msvc@0.48.5
		winnow@0.5.19
		winreg@0.50.0
		winrt-notification@0.5.1
		x11-clipboard@0.8.1
		x11rb@0.12.0
		x11rb-protocol@0.12.0
		xcursor@0.3.4
		xdg-home@1.0.0
		xkeysym@0.2.0
		xml-rs@0.8.19
		zbus@3.14.1
		zbus_macros@3.14.1
		zbus_names@2.6.0
		zerocopy@0.7.25
		zerocopy-derive@0.7.25
		zvariant@3.15.0
		zvariant_derive@3.15.0
		zvariant_utils@1.0.1
		${P}
	"
fi

inherit cargo

DESCRIPTION="A rust version of YouDao Console Version"
HOMEPAGE="https://github.com/farseerfc/ydcv-rs"

if [[ ${PV} == *9999 ]]; then
	EGIT_REPO_URI="https://github.com/farseerfc/${PN}.git"
	inherit git-r3

	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}
else
	SRC_URI="${CARGO_CRATE_URIS}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+clipboard +notify +rustls test"
PROPERTIES="test_network"
RESTRICT="test"

RDEPEND="${DEPEND}
	dev-libs/openssl
	notify? ( sys-apps/dbus )
	clipboard? ( x11-libs/libxcb )
"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_configure() {
	local myfeatures=(
		$(usev clipboard)
		$(usev notify)
		$(usex rustls rustls native-tls)
	)
	cargo_src_configure --no-default-features
}

src_install() {
	cargo_src_install
	einstalldocs
}
