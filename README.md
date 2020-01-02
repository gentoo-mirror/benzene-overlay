# benzene-overlay
Universebenzene's personal Gentoo overlay.

Including some old software that no longer supported by official portage.

Alternative building of astropy related packages (more improvement for the doc building, though some of them only work when the `network-sandbox` FEATURE is diabled, see the USE discriptions for details).

Related overlay: [benzene-testlay](https://github.com/Universebenzene/benzene-testlay), with some packages testing. You can add it for interest.

This overlay is available on [Gentoo repositories](https://overlays.gentoo.org). You can add it simply through several tools (e.g. via layman: `layman -a benzene-overlay`).

### Available packages

Package name | Available version | Additional information
------------ | :---------------: | ----------------------
app-text/ydcv               | 0.7            | Need the [HomeAssistantRepository](https://git.edevau.net/onkelbeh/HomeAssistantRepository) overlay if you enable `pkg-info` use. Some other issues [here](https://forums.gentoo.org/viewtopic-p-8352006.html)
media-video/gnome-mplayer   | 1.0.9-r1                     | Dropped by official portage
media-gfx/gpaint            | 0.3.3                        | With patches from Debian
net-misc/baidunetdisk       | 2.0.1; 2.0.2; 3.0.1          | Converted from [AUR](https://aur.archlinux.org/packages/baidunetdisk-bin) (Also in [gentoo-zh](https://github.com/microcai/gentoo-zh) overlay, while upgrade will be faster here)
net-misc/baidupcs-go        | 3.6; 3.6.1; (live)           | Also in [gentoo-zh](https://github.com/microcai/gentoo-zh) overlay, while upgrade will be faster here
net-misc/baidupcs-go-bin    | 3.6; 3.6.1                   |
x11-libs/lain               | (live version)               |
dev-python/astropy          | 2.0.14; 2.0.16; 3.0.5; 3.1.2 | See [here](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python/astropy#note-for-astropy) for details
dev-python/astropy-helpers  | 2.0.11; 3.0.2; 3.1.1         | With patches for better doc building. Same as the [AUR](https://aur.archlinux.org/packages/python-astropy-helpers/) ones
dev-python/pytest-astropy   | 0.7.0                        | Test plugins for astropy. Dependencies are also in this overlay but not list here
dev-python/sphinx-astropy   | 1.2                          | Modules for building docs of astropy related packages. Dependencies are also in this overlay but not list here
dev-python/sphinx-asdf      | 0.1.0\_rc8                   |
dev-python/asdf             | 1.3.3; 2.5.0                 |
dev-python/astlib           | 0.8.0; 0.11.3                |
dev-python/gwcs             | 0.8.0; 0.10.0                | See [here](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python/gwcs#note-for-gwcs) for details
dev-python/healpy           | 1.11.0                       | See [here](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python/healpy#note-for-healpy) for details
sci-astronomy/astrometry    | 0.78                         | Add USE for switching the netpbm support
