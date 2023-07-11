# benzene-overlay
Universebenzene's personal Gentoo overlay.

Including some old software that no longer supported by official portage.

Alternative building of astropy related packages (more improvement for the doc building and testing, though some of them only work when the `network-sandbox` FEATURE is diabled. See the USE descriptions for details. [(more information)](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python#information-for-astropy-related-packages)

Related overlay: [benzene-testlay](https://github.com/Universebenzene/benzene-testlay), with some packages testing. You can add it for interest.

This overlay is available on [Gentoo repositories](https://overlays.gentoo.org). You can add it simply through several tools (e.g.: `layman -a benzene-overlay` or `eselect repository enable benzene-overlay`).

It's recommended to mask the whole overlay and then unmask just the packages you need, in order not to get mixed up with other overlays with same packages. (e.g. for using wps-office: `echo "*/*::benzene-overlay" > /etc/portage/package.mask/benzene-overlay; echo "app-office/wps-office::benzene-overlay" >> /etc/portage/package.unmask/benzene-overlay`)

### Available packages (some dependencies are not listed here)

Some science related miscellaneous python package are listed in a separate table [below](https://github.com/Universebenzene/benzene-overlay#some-science-related-miscellaneous-python-packages), in order to simplify the main table.

Doc/sphinx and Doc/MkDocs related packages are listed in separate tables [here](https://github.com/Universebenzene/benzene-overlay#docsphinx-related-packages) and [here](https://github.com/Universebenzene/benzene-overlay#docmkdocs-related-packages)

Package name | Available version | Additional information
------------ | :---------------: | ----------------------
app-i18n/fcitx-table-other                                                           | 0.2.4                                                                            | Not included in official portage or other overlays. To install along with an fcitx:5 version you can try [benzene-testlay](https://github.com/Universebenzene/benzene-testlay).
app-office/wps-office                                                                | 11.1.0.11691; [11.1.0.11698](https://github.com/Universebenzene/benzene-overlay/blob/master/app-office/wps-office/wps-office-11.1.0.11698.ebuild)          | Add CN version and more language support (encouraged by [AUR](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=wps-office&outdated=&SB=n&SO=a&PP=50&do_Search=Go)). From `11.1.0.10702` you need to set locale outside to get multi-language support. **Please focus on the output after merging the package**
[app-pda/i4tools](https://www.i4.cn/pro_pc.html)                                     | 1.0.038{,-r1}; 1.0.055{,[-r1](https://github.com/Universebenzene/benzene-overlay/blob/master/app-pda/i4tools/i4tools-1.0.055-r1.ebuild)}                   | 爱思助手
app-text/{[de](https://www.eudic.net/v4/de/app/download),[es](https://www.eudic.net/v4/es/app/download),[fr](https://www.eudic.net/v4/fr/app/download)}helper | [12.7.1](https://github.com/Universebenzene/benzene-overlay/tree/master/app-text) | Converted from [AUR](https://aur.archlinux.org/packages/frhelper) （欧路德语/西语/法语助手）
[app-text/eudic](https://www.eudic.net/v4/en/app/download)                           | [12.7.1](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/eudic/eudic-12.7.1.ebuild)                                                | Converted from [AUR](https://aur.archlinux.org/packages/eudic) （欧路词典）
[app-text/goldendict](http://goldendict.org)                                         | [1.5.0](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/goldendict/goldendict-1.5.0.ebuild); (live)                                | Dropped by official portage. Fix the ebuild for [pg\_overlay](https://gitlab.com/Perfect_Gentleman/PG_Overlay/-/blob/master/app-text/goldendict/goldendict-9999.ebuild). For users preferring qtwebengine rather than qtwebkit, try [this one](https://github.com/bekcpear/ryans-repos/tree/dev/app-text/goldendict) instead.
[app-text/powerword](http://www.iciba.com)                                           | [1.2](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/powerword/powerword-1.2.ebuild)                                              | Encouraged by [AUR](https://aur.archlinux.org/packages/powerword-bin) （金山词霸）
[app-text/ydcv](https://github.com/felixonmars/ydcv)                                 | [0.7](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/ydcv/ydcv-0.7.ebuild); (live)                                                | Need other overlays (like [guru](https://wiki.gentoo.org/wiki/Project:GURU) or [HomeAssistantRepository](https://git.edevau.net/onkelbeh/HomeAssistantRepository)) if you enable `pkg-info` use. Some other issues [here](https://forums.gentoo.org/viewtopic-p-8352006.html) （有道词典命令行-python版）
[app-text/ydgo](https://github.com/boypt/ydgo)                                       | [0.6.3](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/ydgo/ydgo-0.6.3.ebuild); (live)                                            | **Needs interactive inputing during merging process. PAY ATTENTION TO THE OUTPUT MESSAGES** （有道词典命令行-go版）
[app-text/youdao-dict](https://cidian.youdao.com/multi.html#linuxAll)                | [6.0.0-r2](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/youdao-dict/youdao-dict-6.0.0-r2.ebuild)                                | Converted from [AUR](https://aur.archlinux.org/packages/youdao-dict). In order to use this you **must use the patched QtWebkit and PyQt5 with `webkit` USE flag in this overlay INSTEAD OF THE OFFICIAL ONE** （有道词典）
dev-cpp/gtkspellmm                                                                   | 3.0.5                                                                            | Dependency for [gimagereader[gtk]](https://gitlab.com/salfter/portage/-/blob/master/app-text/gimagereader/gimagereader-3.4.1.ebuild)
dev-python/aioftp                                                                    | 0.21.4                                                                           |
dev-python/astlib                                                                    | 0.11.3; 0.11.8                                                                   |
dev-python/corner                                                                    | 2.2.2                                                                            |
dev-python/exifread                                                                  | 3.0.0                                                                            |
dev-python/glymur                                                                    | 0.12.0; 0.12.6\_p1; 0.12.7                                                       |
dev-python/hsluv                                                                     | 5.0.3                                                                            |
dev-python/oldest-supported-numpy                                                    | 2022.11.19                                                                       | The numpy version limitations are changed from `==` into `>=`. If you have better solution, just bring issues or pull requests.
dev-python/parfive                                                                   | 1.5.1; 2.0.2                                                                     |
dev-python/PyQt5                                                                     | 5.15.9                                                                           | Add `webkit` USE flag (dropped by official portage) to get **youdao-dict** in this overlay work
dev-python/pytest-cython                                                             | 0.2.1                                                                            |
dev-python/pytest-socket                                                             | 0.5.0; 0.6.0                                                                     |
dev-python/vispy                                                                     | 0.13.0                                                                           | Doc building may have problems with sandbox permission
dev-python/yt                                                                        | 4.0.5; 4.1.4; 4.2.1                                                              | Full doc building needs huge amount of data, so cannot complete locally.
dev-python/zarr                                                                      | 2.15.0                                                                           |
dev-qt/qtwebkit                                                                      | 5.212.0\_pre20200309-{r1,r2}                                                     | Add [patch](https://github.com/Universebenzene/benzene-overlay/blob/master/dev-qt/qtwebkit/files/qtwebkit-5.212.0_pre20200309-position.patch) to get **youdao-dict** in this overlay work (the -r2 is a test for upgrade EAPI to 8, and might be a little buggy with youdao-dict.)
media-fonts/wps-office-fonts                                                         | [1.0](https://github.com/Universebenzene/benzene-overlay/blob/master/media-fonts/wps-office-fonts/wps-office-fonts-1.0.ebuild)                             | WPS Linux旧版自带方正系字体
[media-gfx/gpaint](https://savannah.gnu.org/projects/gpaint)                         | [0.3.3](https://github.com/Universebenzene/benzene-overlay/blob/master/media-gfx/gpaint/gpaint-0.3.3.ebuild)                                               | With patches from Debian
[media-gfx/fontweak](https://github.com/guoyunhe/fontweak)                           | [1.3.1](https://github.com/Universebenzene/benzene-overlay/blob/master/media-gfx/fontweak/fontweak-1.3.1.ebuild)                                           | GUI for fontconfig
media-libs/gmtk                                                                      | 1.0.9                                                                            | Dropped by official portage. Dependency of media-video/gnome-mplayer
[media-video/bcwc\_pcie](https://github.com/patjak/bcwc_pcie)                        | [(live version)](https://github.com/Universebenzene/benzene-overlay/blob/master/media-video/bcwc_pcie/bcwc_pcie-9999.ebuild)                               | Slightly edited from [menelkir's overlay](https://gitlab.com/menelkir/gentoo-overlay/-/blob/master/media-video/bcwc_pcie/bcwc_pcie-9999.ebuild). If you have any problems about enabling kernel options, take a look at [this](https://asciinema.org/a/YMmYygzctHvKKq7pB97sSHwRu).
[media-video/facetimehd-firmware](https://github.com/patjak/facetimehd-firmware)     | [(live version)](https://github.com/Universebenzene/benzene-overlay/blob/master/media-video/facetimehd-firmware/facetimehd-firmware-9999.ebuild)           | Converted from [AUR](https://aur.archlinux.org/packages/facetimehd-firmware). `9999` indicates the git repo of the downloading tool, not the real version of the firmware (1.43.0 right now).
[media-video/gnome-mplayer](https://sites.google.com/site/kdekorte2/gnomemplayer)    | [1.0.9-r1](https://github.com/Universebenzene/benzene-overlay/blob/master/media-video/gnome-mplayer/gnome-mplayer-1.0.9-r1.ebuild)                         | Dropped by official portage
media-sound/ting-{[de](https://www.eudic.net/v4/de/app/ting),[en](https://www.eudic.net/v4/en/app/ting),[es](https://www.eudic.net/v4/es/app/ting),[fr](https://www.eudic.net/v4/fr/app/ting)}}-bin | [9.4.1](https://github.com/Universebenzene/benzene-overlay/tree/master/media-sound) | 欧路每日德语/英语/西语/法语听力
net-im/electron-qq-bin (masked)                                                      | 1.5.7; 2.1.4                                                                     | Already deprecated and renamed as Icalingua (also in this overlay)
[net-im/electron-wechat-bin](https://github.com/eNkru/freechat)                      | [1.0.0](https://github.com/Universebenzene/benzene-overlay/blob/master/net-im/electron-wechat-bin/electron-wechat-bin-1.0.0.ebuild)                        | Newer project of Electron-built WeChat, a.k.a. Freechat
[net-im/electronic-wechat-bin](https://github.com/Riceneeder/electronic-wechat)      | [2.3.1](https://github.com/Universebenzene/benzene-overlay/blob/master/net-im/electronic-wechat-bin/electronic-wechat-bin-2.3.1.ebuild); 2.3.2 (masked)    | Version 2.3.2 is a fixed version by UOS header. However **Tencent will limit your account if you use this version**, so it's masked now. See [here](https://aur.archlinux.org/packages/electronic-wechat-uos-bin) for more information.
[net-im/icalingua++-bin](https://github.com/Icalingua-plus-plus/Icalingua-plus-plus) | 2.7.7; 2.9.13; [2.9.21](https://github.com/Universebenzene/benzene-overlay/blob/master/net-im/icalingua++-bin/icalingua++-bin-2.9.21.ebuild)               | Previously called Electron QQ. A branch of previous deleted repo, with limited support. Might not work due to [a bug in OICQ](https://github.com/takayama-lily/oicq/issues/408)
[net-im/wemeet](https://source.meeting.qq.com/download-center.html)                  | 2.8.0.3; 3.10.0.401; [3.15.0.402](https://github.com/Universebenzene/benzene-overlay/blob/master/net-im/wemeet/wemeet-3.15.0.402.ebuild)                   | Encouraged by [AUR](https://aur.archlinux.org/packages/wemeet-bin) （腾讯会议）
[net-libs/libaxon-bin](https://codeberg.org/goodspeed/axon)                          | [1.0.2](https://github.com/Universebenzene/benzene-overlay/blob/master/net-libs/libaxon-bin/libaxon-bin-1.0.2.ebuild)                                      | Backend for Purple OICQ
[net-misc/baidunetdisk](https://pan.baidu.com/download)                              | 3.0.1; 4.3.0; [4.17.7](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/baidunetdisk/baidunetdisk-4.17.7.ebuild)                    | Converted from [AUR](https://aur.archlinux.org/packages/baidunetdisk-bin) (Also in [gentoo-zh](https://github.com/microcai/gentoo-zh) overlay, while upgrade will be faster here) （百度网盘）
[net-misc/baidupcs-go](https://github.com/qjfoidnh/BaiduPCS-Go)                      | 3.6.2; 3.8.1; [3.9.2](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/baidupcs-go/baidupcs-go-3.9.2.ebuild); [(live)](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/baidupcs-go/baidupcs-go-9999.ebuild) | Also in [gentoo-zh](https://github.com/microcai/gentoo-zh) overlay, while upgrade will be faster here. **Proxy may needed if you use the `9999` version**, as the [proxy.golang.org](https://proxy.golang.org) is banned in some regions
net-misc/baidupcs-go-bin                                                             | 3.6.2; 3.9.2 |
[net-misc/landrop](https://landrop.app)                                              | [0.4.0](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/landrop/landrop-0.4.0.ebuild); (live)                                      |
[net-misc/sunloginclient](https://sunlogin.oray.com/download)                        | [10.0.2.24779](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/sunloginclient/sunloginclient-10.0.2.24779.ebuild); [11.0.0.36662-r1](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/sunloginclient/sunloginclient-11.0.0.36662-r1.ebuild) | Converted from [AUR](https://aur.archlinux.org/packages/sunloginclient), but **versions ABOVE `10.0.2.24779` may have some problem with OpenRC users** (needs libsystemd). See [here](https://github.com/Universebenzene/benzene-overlay/tree/master/net-misc/sunloginclient#note-for-sunloginclient) for details and solutions（向日葵远程控制）
[net-misc/todesk](https://www.todesk.com/download.html)                              | 4.1.0-r4; [4.3.1.0](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/todesk/todesk-4.3.1.0.ebuild)                                  | Encouraged by [AUR](https://aur.archlinux.org/packages?O=0&SeB=nd&K=todesk-&outdated=&SB=n&SO=a&PP=50&submit=Go) （ToDesk远程控制）
[net-misc/xunlei-download](https://www.xunlei.com)                                   | [1.0.0.2](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/xunlei-download/xunlei-download-1.0.0.2.ebuild)                          | Converted from [AUR](https://aur.archlinux.org/packages/xunlei-bin) （迅雷Linux）
[net-news/quiterss](https://quiterss.org)                                            | [0.19.4](https://github.com/Universebenzene/benzene-overlay/blob/master/net-news/quiterss/quiterss-0.19.4.ebuild); (live)                                  | Dropped by official portage along with qtwebkit
[net-proxy/gg](https://github.com/mzz2017/gg)                                        | 0.2.13; [0.2.18](https://github.com/Universebenzene/benzene-overlay/blob/master/net-proxy/gg/gg-0.2.18.ebuild)                                             |
[net-proxy/v2raya-bin](https://v2raya.org)                                           | 1.5.1698.1; [2.0.5](https://github.com/Universebenzene/benzene-overlay/blob/master/net-proxy/v2raya-bin/v2raya-bin-2.0.5.ebuild)                | Converted from [AUR](https://aur.archlinux.org/packages/v2raya-bin). Needs other overlays like [gentoo-zh](https://github.com/microcai/gentoo-zh)
[sci-astronomy/aladin-bin](https://aladin.u-strasbg.fr/aladin.gml)                   | [12.060](https://github.com/Universebenzene/benzene-overlay/blob/master/sci-astronomy/aladin-bin/aladin-bin-12.060.ebuild)                                 |
[sci-astronomy/astrometry](https://astrometry.net)                                   | 0.78; 0.80; 0.85; [0.93](https://github.com/Universebenzene/benzene-overlay/blob/master/sci-astronomy/astrometry/astrometry-0.93.ebuild)                   | Add USE for switching the netpbm support
[sci-astronomy/healpix](https://healpix.jpl.nasa.gov)                                | [3.82](https://github.com/Universebenzene/benzene-overlay/blob/master/sci-astronomy/healpix/healpix-3.82.ebuild)                                           | [sci-libs/libsharp](https://github.com/Universebenzene/benzene-overlay/tree/master/sci-libs/libsharp) needed for the `cxx` USE flag is also in this overlay but not listed in this table directly
[sci-astronomy/topcat](http://www.star.bris.ac.uk/~mbt/topcat)                       | 4.8; [4.8.8](https://github.com/Universebenzene/benzene-overlay/blob/master/sci-astronomy/topcat/topcat-4.8.8.ebuild)                                      |
sys-libs/libsystemd                                                                  | 253.3; 253.4; 253.5; 253.5-r1; (live)                                            | A standalone package to provide `libsystemd.so` for packages depend on the lib on non-systemd system. [Still on trial](https://github.com/Universebenzene/benzene-overlay/tree/master/sys-libs/libsystemd). **IF YOU HAVE ANY IDEA TO IMPROVE THIS PACKAGE JUST BRING ISSUES OR PULL REQUESTS.**
sys-libs/elogind-libsystemd                                                          | 0                                                                                | An alternative way to provide standalone `libsystemd.so` by just linking `libelogind.so`. **Does not support multilib yet due to elogind itself.**
www-plugins/adobe-flash                                                              | [32.0.0.465](https://github.com/Universebenzene/benzene-overlay/blob/master/www-plugins/adobe-flash/adobe-flash-32.0.0.465.ebuild)                         | Dropped by official portage
[x11-libs/lain](https://github.com/lcpz/lain)                                        | [(live version)](https://github.com/Universebenzene/benzene-overlay/blob/master/x11-libs/lain/lain-9999-r100.ebuild)                                       | 9999 for old ebuild without lua targets support (masked); 9999-r100 with the new `lua-single` eclass
[x11-plugins/purple-oicq](https://codeberg.org/goodspeed/purple-oicq)                | [1.0.2](https://github.com/Universebenzene/benzene-overlay/blob/master/x11-plugins/purple-oicq/purple-oicq-1.0.2.ebuild); (live)                           | OICQ plugin (Tencent QQ support) for Pidgin/libpurple.
virtual/libsystemd                                                                   | 0                                                                                | A virtual package for choosing `libsystemd.so` packages

Information for some of the astropy related packages are listed [here](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python#information-for-astropy-related-packages).

### Some science related miscellaneous python packages

Packages in this table might just be pulled in as dependencies by some sicense related python packages.

<!--<details>
<summary>(Click to unfold)</summary>-->

Package name | Available version | Additional information
------------ | :---------------: | ----------------------
dev-python/adal                  | 1.2.7                                             | SunPy, h5pyd related
dev-python/abg-python            | 1.1.3                                             | Optional for yt
dev-python/aggdraw               | 1.3.16                                            | Optional for ginga
dev-python/aiobotocore           | 2.5.2                                             | Pulled in by zarr
dev-python/aioitertools          | 0.11.0                                            | Pulled in by zarr
dev-python/arviz                 | 0.15.1                                            | Optional for corner.py.
dev-python/asciitree             | 0.3.3                                             | Pulled in by zarr
dev-python/azure-core            | 1.26.3                                            | Required by new msrest
dev-python/bidict                | 0.22.0; 0.22.1                                    | Optional for yt
dev-python/cmdstanpy             | 1.0.8; 1.1.0                                      | Test dependency for arviz
dev-python/distributed           | 2023.5.1; 2023.6.0; 2023.6.1; 2023.7.0            | Optional for arviz and spectral-cube
dev-python/eventlet              | 0.33.3                                            | Dropped by official portage. Required by firefly{,-viz}
dev-python/f90nml                | 1.4.3                                             | Optional for yt
dev-python/fastcache             | 1.1.0                                             | Optional for yt
dev-python/firefly-viz           | 2.0.4                                             | Optional for yt
dev-python/firefly               | 3.2.3                                             | Optional for new yt
dev-python/flask-socketio        | 5.3.4                                             | Optional for yt
dev-python/fusepy                | 3.0.1                                             | Optional for yt
dev-python/heapdict              | 1.0.1                                             | Pulled in by zict and distributed
dev-python/indexed\_{bzip2,zstd} | 1.5.0 / 1.6.0                                     | Optional for yt
dev-python/libconf               | 2.0.1                                             | Optional for yt
dev-python/miniballcpp           | 0.2.3                                             | Optional for yt
dev-python/msrest                | 0.7.1                                             | SunPy, h5pyd related
dev-python/msrestazure           | 0.6.4                                             | SunPy, h5pyd related
dev-python/numcodecs             | 0.11.0                                            | Pulled in by zarr
dev-python/pykdtree              | 1.3.7\_p0                                         | Optional for yt
dev-python/pytest-golden         | 0.2.2                                             | Test dependency for mkdocstrings related packages
dev-python/pytest-repeat         | 0.9.1                                             | Test dependency for new zict
dev-python/python-socketio       | 5.8.0                                             | Optional for yt
dev-python/python-xz             | 0.5.0                                             | Optional for yt
dev-python/rasterio              | 1.3.8                                             | Optional for photutils. Dependencies are not all listed in the table
dev-python/ratarmount            | 0.13.0                                            | Optional for yt. Dependency ratarmountcore is also included in this overlay but not listed in the table
dev-python/s3fs                  | 2023.5.0; 2023.6.0                                | Test dependency for zarr and astropy>=5.2
dev-python/siosocks              | 0.3.0                                             | Optional for aioftp
dev-python/colorspacious         | 1.1.2                                             | Pulled in by cmyt. Dropped by official portage
dev-python/cmyt                  | 1.3.0                                             | Pulled in by yt
dev-python/unyt                  | 2.9.5                                             | Pulled in by yt
dev-python/zict                  | 2.2.0; 3.0.0                                      | Pulled in by distributed

<!--</details>-->

### Doc/sphinx related packages

<!--<details>
<summary>(Click to unfold)</summary>-->

Package name | Available version | Additional information
------------ | :---------------: | ----------------------
dev-python/ablog                 | 0.11.4\_p1          |
dev-python/jupyter-cache         | 0.6.1               |
dev-python/jupyter-sphinx        | 0.4.0               |
dev-python/jupytext              | 1.14.7              | Build with wheel source to include Jupyter Lab Extenstion
dev-python/myst-nb               | 0.17.2              |
dev-python/myst-parser           | 0.18.1-r1           | Only for myst-nb that depends on old version
dev-python/runnotebook           | 0.3.1; (live)       |
dev-python/sphinx-astropy        | 1.6.0; 1.9.1        | See [here](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python#information-for-astropy-related-packages) for more information.
dev-python/sphinx-asdf           | 0.1.3; 0.1.4; 0.2.0 |
dev-python/sphinx-autobuild      | 2022.3.14           |
dev-python/sphinx-book-theme     | 0.2.0; 1.0.1        | `network-sandbox` FEATURE will be disabled if you enable `doc` flag for newest version.
dev-python/sphinx-changelog      | 1.3.0               |
dev-python/sphinx-click          | 4.4.0               |
dev-python/sphinx-codeautolink   | 0.15.0              |
dev-python/sphinx-copybutton     | 0.5.2               |
dev-python/sphinx-design         | 0.4.1               |
dev-python/sphinx-examples       | 0.0.5               |
dev-python/sphinx-inline-tabs    | 2023.4.21           |
dev-python/sphinx-readable-theme | 1.3.0               |
dev-python/sphinx-thebe          | 0.2.1               |
dev-python/sphinx-togglebutton   | 0.3.1               |
dev-python/sphinx\_contributors  | 0.2.7               |
dev-python/sphinx\_mdinclude     | 0.5.3               |
dev-python/sphinxcontrib-youtube | 1.2.0               | `network-sandbox` FEATURE will be disabled if you enable demo videos for doc building.
dev-python/sphinxext-opengraph   | 0.8.2               |
dev-python/dask-sphinx-theme     | 3.0.5               |
dev-python/sunpy-sphinx-theme    | 1.2.42              |
dev-python/mistune               | 0.8.4-r1            | Only for sphinx-asdf that depends on old version
dev-python/nbconvert             | 6.4.5               | Depends on old mistune

<!--</details>-->

### Doc/MkDocs related packages

<!--<details>
<summary>(Click to unfold)</summary>-->

Package name | Available version        | Additional information
------------ | :---------------:        | ----------------------
dev-python/docstring-parser             | 0.15            | Optional dependency of pytkdocs
dev-python/markdown-callouts            | 0.3.0           | mkdocstrings related (should be test depend)
dev-python/markdown-exec                | 1.6.0           | mkdocstrings related (should be test depend)
dev-python/mkdocs-coverage              | 0.2.7           | mkdocstrings related (should be test depend)
dev-python/mkdocs-gen-files             | 0.5.0           | mkdocstrings related (should be test depend)
dev-python/mkdocs-git-committers-plugin | 1.1.2           | mkdocstrings related (should be test depend)
dev-python/mkdocs-jupyter               | 0.24.2          |
dev-python/mkdocs-literate-nav          | 0.6.0           | mkdocstrings related (should be test depend)
dev-python/mkdocs-section-index         | 0.3.5           | mkdocstrings related (should be test depend)
dev-python/mkdocstrings-crystal         | 0.3.5; 0.3.6    |
dev-python/mkdocstrings-python-legacy   | 0.2.3           |
dev-python/pytkdocs                     | 0.16.1          | Dependency of mkdocstrings-python-legacy

<!--</details>-->
