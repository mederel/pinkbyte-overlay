# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/AlexCones/LORA.git"

inherit eutils git-2

DESCRIPTION="LORA is console client for linux.org.ru forum"
HOMEPAGE="https://github.com/AlexCones/LORA"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="sys-apps/sed
	sys-apps/gawk
	dev-python/lxml
	app-shells/bash
	"

src_prepare() {
	sed -i -e "s:INSTALL_DIR = /opt/lora:INSTALL_DIR = ${D}/opt/lora:" Makefile
}

src_compile() { :; }

src_install() {
	emake DESTDIR="${D}" install
	dodoc README
}

pkg_postinst() {
	einfo "LORA installed into /opt/lora"
	einfo "Feel free to change PATH variable or run it manually like '/opt/lora/lora.sh'"
}
