# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PHP_EXT_NAME="ssh2"

USE_PHP="php5-6 php7-0 php7-1 php7-2"

inherit php-ext-pecl-r3

USE_PHP="php7-0 php7-1 php7-2"

DESCRIPTION="PHP bindings for the libssh2 library"
LICENSE="PHP-3.01"
SLOT="7"
IUSE=""
KEYWORDS="~amd64 x86"
# Upstream notes say there are errors with gcrypt backend
DEPEND=">=net-libs/libssh2-1.2[-gcrypt]"
RDEPEND="${DEPEND}
	php_targets_php5-6? ( dev-php/pecl-ssh2:0[php_targets_php5-6] )"

src_prepare() {
	if use php_targets_php7-0 || use php_targets_php7-1 || use php_targets_php7-2; then
		php-ext-source-r3_src_prepare
	else
		default_src_prepare
	fi
}
