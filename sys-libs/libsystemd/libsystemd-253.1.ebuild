# Copyright 2011-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{9..11} )

# Avoid QA warnings
TMPFILES_OPTIONAL=1

QA_PKGCONFIG_VERSION=$(ver_cut 1)

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/systemd/systemd.git"
	inherit git-r3
else
	if [[ ${PV} == *.* ]]; then
		MY_PN=systemd-stable
	else
		MY_PN=systemd
	fi
	MY_PV=${PV/_/-}
	MY_P=${MY_PN}-${MY_PV}
	S=${WORKDIR}/${MY_P}
	SRC_URI="https://github.com/systemd/${MY_PN}/archive/v${MY_PV}/${MY_P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"
fi

inherit bash-completion-r1 linux-info meson-multilib ninja-utils pam

inherit python-any-r1 toolchain-funcs #systemd udev usr-ldscript

DESCRIPTION="A standalone package to provide libsystemd.so without systemd"
HOMEPAGE="http://systemd.io/"

LICENSE="GPL-2 LGPL-2.1 MIT public-domain"
SLOT="0/2"
IUSE="
	acl apparmor audit cgroup-hybrid cryptsetup curl +dns-over-tls elfutils
	fido2 +gcrypt gnuefi gnutls homed http idn importd iptables +kmod
	+lz4 lzma +openssl pam pcre pkcs11 policykit pwquality qrcode
	+resolvconf +seccomp selinux split-usr +sysv-utils test tpm vanilla xkb +zstd
"

REQUIRED_USE="
	dns-over-tls? ( || ( gnutls openssl ) )
	homed? ( cryptsetup pam openssl )
	importd? ( curl lzma || ( gcrypt openssl ) )
	pwquality? ( homed )
"
RESTRICT="!test? ( test )"

MINKV="4.15"

COMMON_DEPEND="
	>=sys-apps/util-linux-2.30:0=[${MULTILIB_USEDEP}]
	sys-libs/libcap:0=[${MULTILIB_USEDEP}]
	virtual/libcrypt:=[${MULTILIB_USEDEP}]
	acl? ( sys-apps/acl:0= )
	apparmor? ( sys-libs/libapparmor:0= )
	audit? ( >=sys-process/audit-2:0= )
	cryptsetup? ( >=sys-fs/cryptsetup-2.0.1:0= )
	curl? ( net-misc/curl:0= )
	elfutils? ( >=dev-libs/elfutils-0.158:0= )
	fido2? ( dev-libs/libfido2:0= )
	gcrypt? ( >=dev-libs/libgcrypt-1.4.5:0=[${MULTILIB_USEDEP}] )
	gnutls? ( >=net-libs/gnutls-3.6.0:0= )
	http? ( >=net-libs/libmicrohttpd-0.9.33:0=[epoll(+)] )
	idn? ( net-dns/libidn2:= )
	importd? (
		app-arch/bzip2:0=
		sys-libs/zlib:0=
	)
	kmod? ( >=sys-apps/kmod-15:0= )
	lz4? ( >=app-arch/lz4-0_p131:0=[${MULTILIB_USEDEP}] )
	lzma? ( >=app-arch/xz-utils-5.0.5-r1:0=[${MULTILIB_USEDEP}] )
	iptables? ( net-firewall/iptables:0= )
	openssl? ( >=dev-libs/openssl-1.1.0:0= )
	pam? ( sys-libs/pam:=[${MULTILIB_USEDEP}] )
	pkcs11? ( app-crypt/p11-kit:0= )
	pcre? ( dev-libs/libpcre2 )
	pwquality? ( dev-libs/libpwquality:0= )
	qrcode? ( media-gfx/qrencode:0= )
	seccomp? ( >=sys-libs/libseccomp-2.3.3:0= )
	selinux? ( sys-libs/libselinux:0= )
	tpm? ( app-crypt/tpm2-tss:0= )
	xkb? ( >=x11-libs/libxkbcommon-0.4.1:0= )
	zstd? ( >=app-arch/zstd-1.4.0:0=[${MULTILIB_USEDEP}] )
"

# Newer linux-headers needed by ia64, bug #480218
DEPEND="${COMMON_DEPEND}
	>=sys-kernel/linux-headers-${MINKV}
	gnuefi? ( >=sys-boot/gnu-efi-3.0.2 )
"

# baselayout-2.2 has /run
RDEPEND="${COMMON_DEPEND}
	!sys-apps/systemd
"

BDEPEND="
	app-arch/xz-utils:0
	dev-util/gperf
	>=dev-util/meson-0.46
	>=sys-apps/coreutils-8.16
	sys-devel/gettext
	virtual/pkgconfig
	test? (
		app-text/tree
		dev-lang/perl
		sys-apps/dbus
	)
	app-text/docbook-xml-dtd:4.2
	app-text/docbook-xml-dtd:4.5
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt:0
	$(python_gen_any_dep 'dev-python/jinja[${PYTHON_USEDEP}]')
	$(python_gen_any_dep 'dev-python/lxml[${PYTHON_USEDEP}]')
"

python_check_deps() {
	python_has_version "dev-python/jinja[${PYTHON_USEDEP}]" &&
	python_has_version "dev-python/lxml[${PYTHON_USEDEP}]"
}

QA_FLAGS_IGNORED="usr/lib/systemd/boot/efi/.*"
QA_EXECSTACK="usr/lib/systemd/boot/efi/*"

pkg_pretend() {
	if [[ ${MERGE_TYPE} != buildonly ]]; then
		if use test && has pid-sandbox ${FEATURES}; then
			ewarn "Tests are known to fail with PID sandboxing enabled."
			ewarn "See https://bugs.gentoo.org/674458."
		fi

		local CONFIG_CHECK=" ~BINFMT_MISC ~BLK_DEV_BSG ~CGROUPS
			~CGROUP_BPF ~DEVTMPFS ~EPOLL ~FANOTIFY ~FHANDLE
			~INOTIFY_USER ~IPV6 ~NET ~NET_NS ~PROC_FS ~SIGNALFD ~SYSFS
			~TIMERFD ~TMPFS_XATTR ~UNIX ~USER_NS
			~CRYPTO_HMAC ~CRYPTO_SHA256 ~CRYPTO_USER_API_HASH
			~!GRKERNSEC_PROC ~!IDE ~!SYSFS_DEPRECATED
			~!SYSFS_DEPRECATED_V2"

		use acl && CONFIG_CHECK+=" ~TMPFS_POSIX_ACL"
		use seccomp && CONFIG_CHECK+=" ~SECCOMP ~SECCOMP_FILTER"

		if kernel_is -ge 5 10 20; then
			CONFIG_CHECK+=" ~KCMP"
		else
			CONFIG_CHECK+=" ~CHECKPOINT_RESTORE"
		fi

		if kernel_is -ge 4 18; then
			CONFIG_CHECK+=" ~AUTOFS_FS"
		else
			CONFIG_CHECK+=" ~AUTOFS4_FS"
		fi

		if linux_config_exists; then
			local uevent_helper_path=$(linux_chkconfig_string UEVENT_HELPER_PATH)
			if [[ -n ${uevent_helper_path} ]] && [[ ${uevent_helper_path} != '""' ]]; then
				ewarn "It's recommended to set an empty value to the following kernel config option:"
				ewarn "CONFIG_UEVENT_HELPER_PATH=${uevent_helper_path}"
			fi
			if linux_chkconfig_present X86; then
				CONFIG_CHECK+=" ~DMIID"
			fi
		fi

		if kernel_is -lt ${MINKV//./ }; then
			ewarn "Kernel version at least ${MINKV} required"
		fi

		check_extra_config
	fi
}

pkg_setup() {
	:
}

src_unpack() {
	default
	[[ ${PV} != 9999 ]] || git-r3_src_unpack
}

src_prepare() {
	local PATCHES=(
		"${FILESDIR}/systemd-253-initrd-generators.patch"
	)

	if ! use vanilla; then
		PATCHES+=(
			"${FILESDIR}/gentoo-generator-path-r2.patch"
			"${FILESDIR}/gentoo-journald-audit-r1.patch"
		)
	fi

	# Fails with split-usr.
	sed -i -e '2i exit 77' test/test-rpm-macros.sh || die

	default
}

src_configure() {
	# Prevent conflicts with i686 cross toolchain, bug 559726
	tc-export AR CC NM OBJCOPY RANLIB

	python_setup

	multilib-minimal_src_configure
}

multilib_src_configure() {
	local myconf=(
		--localstatedir="${EPREFIX}/var"
		-Dsupport-url="https://gentoo.org/support/"
		-Dpamlibdir="$(getpam_mod_dir)"
		# avoid bash-completion dep
		-Dbashcompletiondir="$(get_bashcompdir)"
		# make sure we get /bin:/sbin in PATH
		$(meson_use split-usr)
		$(meson_use split-usr split-bin)
		-Drootprefix="$(usex split-usr "${EPREFIX:-/}" "${EPREFIX}/usr")"
		-Drootlibdir="${EPREFIX}/usr/$(get_libdir)"
		# Disable compatibility with sysvinit
		-Dsysvinit-path=
		-Dsysvrcnd-path=
		# Avoid infinite exec recursion, bug 642724
		-Dtelinit-path="${EPREFIX}/lib/sysvinit/telinit"
		# no deps
		-Dima=true
		-Ddefault-hierarchy=$(usex cgroup-hybrid hybrid unified)
		# Optional components/dependencies
		$(meson_native_use_bool acl)
		$(meson_native_use_bool apparmor)
		$(meson_native_use_bool audit)
		$(meson_native_use_bool cryptsetup libcryptsetup)
		$(meson_native_use_bool curl libcurl)
		$(meson_native_use_bool dns-over-tls dns-over-tls)
		$(meson_native_use_bool elfutils)
		$(meson_native_use_bool fido2 libfido2)
		$(meson_use gcrypt)
		$(meson_native_use_bool gnuefi gnu-efi)
		$(meson_native_use_bool gnutls)
		-Defi-includedir="${ESYSROOT}/usr/include/efi"
		-Defi-libdir="${ESYSROOT}/usr/$(get_libdir)"
		$(meson_native_use_bool homed)
		$(meson_native_use_bool http microhttpd)
		$(meson_native_use_bool idn)
		$(meson_native_use_bool importd)
		$(meson_native_use_bool importd bzip2)
		$(meson_native_use_bool importd zlib)
		$(meson_native_use_bool kmod)
		$(meson_use lz4)
		$(meson_use lzma xz)
		$(meson_use zstd)
		$(meson_native_use_bool iptables libiptc)
		$(meson_native_use_bool openssl)
		$(meson_use pam)
		$(meson_native_use_bool pkcs11 p11kit)
		$(meson_native_use_bool pcre pcre2)
		$(meson_native_use_bool policykit polkit)
		$(meson_native_use_bool pwquality)
		$(meson_native_use_bool qrcode qrencode)
		$(meson_native_use_bool seccomp)
		$(meson_native_use_bool selinux)
		$(meson_native_use_bool tpm tpm2)
		$(meson_native_use_bool test dbus)
		$(meson_native_use_bool xkb xkbcommon)
		-Dntp-servers="0.gentoo.pool.ntp.org 1.gentoo.pool.ntp.org 2.gentoo.pool.ntp.org 3.gentoo.pool.ntp.org"
		# Breaks screen, tmux, etc.
		-Ddefault-kill-user-processes=false
		-Dcreate-log-dirs=false

		# multilib options
		$(meson_native_true backlight)
		$(meson_native_true binfmt)
		$(meson_native_true coredump)
		$(meson_native_true environment-d)
		$(meson_native_true firstboot)
		$(meson_native_true hibernate)
		$(meson_native_true hostnamed)
		$(meson_native_true ldconfig)
		$(meson_native_true localed)
		$(meson_native_true man)
		$(meson_native_true networkd)
		$(meson_native_true quotacheck)
		$(meson_native_true randomseed)
		$(meson_native_true rfkill)
		$(meson_native_true sysusers)
		$(meson_native_true timedated)
		$(meson_native_true timesyncd)
		$(meson_native_true tmpfiles)
		$(meson_native_true vconsole)
	)

	meson_src_configure "${myconf[@]}"
}

multilib_src_test() {
	eninja test
}

multilib_src_compile() {
	local libsystemd=$(readlink libsystemd.so.0)
	local targets=(
		${libsystemd}
	)
	eninja "${targets[@]}"
}

multilib_src_install() {
	use split-usr && into /
	dolib.so libsystemd.so{,*.0}

	use split-usr && dosym ../../$(get_libdir)/libsystemd.so.0 /usr/$(get_libdir)/libsystemd.so
}