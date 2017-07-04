
Debian
====================
This directory contains files used to package planbcoind/planbcoin-qt
for Debian-based Linux systems. If you compile planbcoind/planbcoin-qt yourself, there are some useful files here.

## planbcoin: URI support ##


planbcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install planbcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your planbcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/planbcoin128.png` to `/usr/share/pixmaps`

planbcoin-qt.protocol (KDE)

