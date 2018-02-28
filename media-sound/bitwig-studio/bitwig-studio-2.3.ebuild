# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Based on: https://github.com/dstien/dstien-portage/blob/master/media-sound/bitwig-studio/bitwig-studio-1.1.8.ebuild

EAPI=6
inherit eutils xdg-utils gnome2-utils unpacker

DESCRIPTION="Music production and performance system"
HOMEPAGE="http://bitwig.com/"
SRC_URI="http://downloads.bitwig.com/stable/${PV}/${P}.deb"
LICENSE="Bitwig Commercial EULA"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

IUSE="libav"

DEPEND=""
RDEPEND="${DEPEND}
		dev-java/jython
		dev-java/oracle-jre-bin:1.8
		dev-libs/expat
		dev-libs/libbsd
		gnome-extra/zenity
		libav? ( media-video/libav )
		media-libs/alsa-lib
		media-libs/fontconfig
		media-libs/freetype
		media-libs/libpng:0/16
		media-libs/mesa
		media-sound/jack2
		virtual/jack
		virtual/opengl
		virtual/udev
		x11-libs/cairo[xcb]
		x11-libs/libX11
		x11-libs/libXau
		x11-libs/libXcursor
		x11-libs/libXdmcp
		x11-libs/libXext
		x11-libs/libXfixes
		x11-libs/libXrender
		x11-libs/libdrm
		x11-libs/libxcb
		x11-libs/libxkbfile
		x11-libs/pixman
		x11-libs/xcb-util-wm"

S=${WORKDIR}

src_prepare() {
	# Remove bundled JRE
	rm -r "${S}/opt/bitwig-studio/lib/jre"

	# Fix desktop file validation errors
	sed -i \
		-e 's/^\(Icon=.*\).png$/\1/g' \
		-e 's/^\(Categories=\)Multimedia.*$/\1Audio\;AudioVideo\;/g' \
		usr/share/applications/bitwig-studio.desktop || die
	xdg_environment_reset
	eapply_user
}

src_install() {
	BITWIG_HOME="/opt/bitwig-studio"
	insinto ${BITWIG_HOME}
	doins -r opt/bitwig-studio/*

	fperms +x ${BITWIG_HOME}/bin/BitwigPluginHost64
	fperms +x ${BITWIG_HOME}/bin/BitwigStudioEngine
	fperms +x ${BITWIG_HOME}/bin/bitwig-vamphost
	fperms +x ${BITWIG_HOME}/bin/show-splash-gtk
	fperms +x ${BITWIG_HOME}/bin32/BitwigPluginHost32
	fperms +x ${BITWIG_HOME}/bitwig-studio

	dosym ${BITWIG_HOME}/bitwig-studio /usr/bin/bitwig-studio
	exeinto "${BITWIG_HOME}/bin"
	dosym ${JAVA_HOME}/bin/java ${BITWIG_HOME}/bin/BitwigStudio

	insinto /usr/share/mime/packages
	doins usr/share/mime/packages/bitwig-studio.xml

	doicon -c apps -s 48 usr/share/icons/hicolor/48x48/apps/bitwig-modular.png
	doicon -c apps -s 48 usr/share/icons/hicolor/48x48/apps/bitwig-studio.png
	doicon -c apps -s scalable usr/share/icons/hicolor/scalable/apps/bitwig-modular.svg
	doicon -c apps -s scalable usr/share/icons/hicolor/scalable/apps/bitwig-studio.svg
	doicon -c mimetypes -s scalable usr/share/icons/hicolor/scalable/mimetypes/application-bitwig-*.svg

	domenu usr/share/applications/bitwig-studio.desktop
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_mime_database_update
	xdg_desktop_database_update

	if ! use libav; then
		einfo "libav USE flag not set. Bitwig Studio require the avprobe and avconv tools"
		einfo "for importing audio files."
	fi
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_mime_database_update
	xdg_desktop_database_update
}
