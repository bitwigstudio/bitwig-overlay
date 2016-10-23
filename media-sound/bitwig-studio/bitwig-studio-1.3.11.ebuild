# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils unpacker

DESCRIPTION="Commercial version of Bitwig Studio"
HOMEPAGE="https://www.bitwig.com"
SRC_URI="${P}.deb"

LICENSE="Bitwig Commercial EULA"
SLOT="3"
KEYWORDS="~amd64 ~x86"

RESTRICT="fetch strip"

RDEPEND="
	virtual/jack
	gnome-extra/zenity"

src_unpack() {
	unpack_deb "${A}"

	mkdir "${P}" || die
	mv "opt" "${P}/" || die
	mv "usr" "${P}/" || die

	chmod ugo-wx ${P}/opt/bitwig-studio/lib/engine/* || die

}

src_prepare() { 
	default
	true;
}

src_install() {
	
	
	mv * "${D}" || die


}




