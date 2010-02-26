# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

inherit eutils flag-o-matic

MOUNT=mount_ewf-20090529.py

DESCRIPTION="Implementation of the EWF (SMART and EnCase) image format"
HOMEPAGE="http://libewf.sourceforge.net"
SRC_URI="mirror://sourceforge/libewf/${P}.tar.gz
	python? ( mirror://sourceforge/libewf/${MOUNT} )"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~s390 ~sparc ~x86"
IUSE="debug python rawio unicode v2-api"

DEPEND="|| (
			>=sys-apps/util-linux-2.16
			<=sys-libs/e2fsprogs-libs-1.41.8
		)
	unicode? ( dev-libs/libuna )
	python? ( dev-lang/python )
	sys-libs/zlib
	dev-libs/openssl"
RDEPEND="${DEPEND}"

src_configure() {
	append-flags -fno-strict-aliasing # avoid type-punned warnings
	econf \
		$(use_enable unicode wide-character-type) \
		$(use_enable rawio low-level-functions) \
		$(use_enable debug verbose-output) \
		$(use_enable debug debug-output) \
		$(use_enable v2-api) \
		$(use_enable python)
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog NEWS README documents/*.txt
	if use python; then
		newsbin ${DISTDIR}/${MOUNT} mount_ewf \
			|| die "install mount_ewf failed"
	fi
}