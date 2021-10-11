# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop udev xdg

DESCRIPTION="A third-party tool for managing Apple (iOS) devices"
HOMEPAGE="https://www.i4.cn"
SRC_URI="https://d-updater.i4.cn/i4linux/deb/i4tools_v${PV}.deb"

LICENSE="i4"
SLOT="0"
RESTRICT="strip"
KEYWORDS="~amd64"

RDEPEND="media-video/ffmpeg[cdio,iec61883,ieee1394,jack,libcaca,librtmp,sdl,speex,twolame,webp]
	media-plugins/gst-plugins-meta[mp3,wavpack]
	app-pda/usbmuxd
	net-nds/openldap
	sys-process/numactl
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	sed -i 's#usr/share#opt#g' \
		usr/share/{applications/${PN}.desktop,polkit-1/actions/org.${PN}linux.policy,${PN}/${PN}linux.sh} || die
	default
}

src_install() {
	udev_dorules etc/udev/rules.d/39-i4tools.rules

	insinto /usr/share
	doins -r usr/share/polkit-1

	local USD="usr/share/${PN}"
	local OPD="opt/${PN}"
	insinto /${OPD}
	doins -r ${USD}/{files,${PN}.png,qt.conf,resources,translations}

	insinto /${OPD}/lib/openssl
	doins -r ${USD}/lib/openssl/pkgconfig

	insopts -m755
	insinto /${OPD}
	doins -r ${USD}/{${PN}linux{,.sh},libexec,plugins}

	insinto /${OPD}/lib
	doins -r ${USD}/lib/{*so*,customui}

	insinto /${OPD}/lib/openssl
	doins -r ${USD}/lib/openssl/{*so*,engines-1.1}

	dosym -r /usr/$(get_libdir)/libwebp.so /${OPD}/lib/libwebp.so.6
	dosym -r /${OPD}/${PN}linux.sh /usr/bin/${PN}
	domenu usr/share/applications/${PN}.desktop
}
