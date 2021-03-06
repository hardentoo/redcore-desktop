# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit user udev

MY_P=vhba-module-${PV}
DESCRIPTION="Virtual (SCSI) Host Bus Adapter kernel module for the CDEmu suite"
HOMEPAGE="http://cdemu.org"
SRC_URI="mirror://sourceforge/cdemu/${MY_P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 ~hppa x86"
IUSE=""

DEPEND="~sys-kernel/${PN}-dkms-${PV}"
RDEPEND="${DEPEND}
	virtual/udev
	virtual/pkgconfig"

S=${WORKDIR}/${MY_P}

pkg_setup() {
	enewgroup cdemu
}

src_prepare() {
	:
}

src_compile() {
	:
}

src_install() {
	dodoc AUTHORS ChangeLog README
	einfo "Generating udev rules ..."
	dodir "$(get_udevdir)"/rules.d
	cat > "${D}/$(get_udevdir)"/rules.d/70-vhba.rules <<-EOF || die
	# do not edit this file, it will be overwritten on update
	#
	KERNEL=="vhba_ctl", MODE="0660", OWNER="root", GROUP="cdemu"
	EOF
}

pkg_postinst() {
	elog "Don't forget to add your user to the cdemu group if you want to"
	elog "be able to use virtual cdemu devices."
}
