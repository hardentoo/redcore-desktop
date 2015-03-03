# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit xfconf

DESCRIPTION="A tool to find and launch installed applications for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"
SRC_URI="mirror://xfce/src/xfce/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="debug"

RDEPEND=">=dev-libs/dbus-glib-0.100
	>=dev-libs/glib-2.30
	>=x11-libs/gtk+-3.2:3
	>=xfce-base/garcon-0.4.0
	>=xfce-base/libxfce4util-4.12.1
	>=xfce-base/libxfce4ui-4.12.0
	>=xfce-base/xfconf-4.12.0
	!xfce-base/xfce-utils"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		--enable-gtk3
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog NEWS )
}