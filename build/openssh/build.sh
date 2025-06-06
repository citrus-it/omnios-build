#!/usr/bin/bash
#
# {{{ CDDL HEADER
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
# }}}
#
# Copyright 2015 OmniTI Computer Consulting, Inc.  All rights reserved.
# Copyright 2025 OmniOS Community Edition (OmniOSce) Association.

. ../../lib/build.sh

PROG=openssh
VER=10.0p2
PKG=network/openssh
SUMMARY="OpenSSH Client and utilities"
DESC="OpenSSH Secure Shell protocol Client and associated Utilities"

# There was a mistake in the release process for OpenSSH 10.0p1 in that it
# identifies itself as 10.0p2. There was no corrected release made so we
# have to change the build directory back to 10.0p1. This can be removed on
# the next update.
set_builddir $PROG-10.0p1

set_arch 64

SKIP_LICENCES=OpenSSH

CONFIGURE_OPTS[amd64]+=" --sysconfdir=/etc/ssh"
CONFIGURE_OPTS[aarch64]+=" --sysconfdir=/etc/ssh"

CONFIGURE_OPTS="
    --with-audit=solaris
    --with-pam
    --with-sandbox=solaris
    --with-solaris-contracts
    --with-solaris-privs
    --with-tcp-wrappers
    --with-4in6
    --enable-strip=no
    --without-rpath
    --disable-lastlog
    --with-privsep-user=daemon
    --with-ssl-engine
    --with-solaris-projects
"
CONFIGURE_OPTS[amd64]+="
    --with-kerberos5=$PREFIX
    --with-libedit=$PREFIX
"
CONFIGURE_OPTS[aarch64]+="
    --enable-etc-default-login
    ac_cv_file__etc_default_login=yes
"

CFLAGS+=" -fstack-check"
CFLAGS+=" -DPAM_ENHANCEMENT -DSET_USE_PAM -DPAM_BUGFIX"
CFLAGS+=" -I/usr/include/kerberosv5 -DKRB5_BUILD_FIX -DDISABLE_BANNER"
CFLAGS+=" -DDEPRECATE_SUNSSH_OPT -DOPTION_DEFAULT_VALUE -DSANDBOX_SOLARIS"
CFLAGS[amd64]+=" -DDTRACE_SFTP"
LDFLAGS+=" -lumem"

build_init() {
    CFLAGS[aarch64]+=" -I${SYSROOT[aarch64]}/usr/include"
    LDFLAGS[aarch64]+=" -L${SYSROOT[aarch64]}/usr/lib"
    LDFLAGS[aarch64]+=" -L${SYSROOT[aarch64]}/usr"
}

pre_make() {
    # OpenSSH is able to build with -Werror (it's part of their CI) and
    # doing the same helps validate our local patches.
    # However, we must defer adding this to the CFLAGS until after configure so
    # that feature detection works properly.
    CFLAGS+=" -Werror"
}

post_install() {
    logmsg "--- installing ssh-copy-id from contrib"
    logcmd cp $TMPDIR/$BUILDDIR/contrib/ssh-copy-id $DESTDIR/usr/bin/ \
        || logerr "Could not install ssh-copy-id"
    logcmd chmod 755 $DESTDIR/usr/bin/ssh-copy-id || logerr "chmod failed"
    logcmd cp $TMPDIR/$BUILDDIR/contrib/ssh-copy-id.1 \
        $DESTDIR/usr/share/man/man1/ \
        || logerr "Could not install ssh-copy-id.1"

    install_smf network ssh.xml sshd

    manifest_start $TMPDIR/manifest.server
    manifest_add etc/ssh moduli sshd_config
    manifest_add_dir lib/svc manifest/network method
    manifest_add_dir usr/lib/dtrace/64
    manifest_add usr/libexec sftp-server
    manifest_add usr/libexec/amd64 sftp-server sshd-session
    manifest_add usr/sbin sshd
    manifest_add usr/share/man/man1m sshd.8 sftp-server.8
    manifest_add usr/share/man/man4 moduli.5 sshd_config.5
    manifest_add_dir var/empty
    manifest_finalise $TMPDIR/manifest.server $PREFIX etc

    manifest_uniq $TMPDIR/manifest.{client,server}
    manifest_finalise $TMPDIR/manifest.client $PREFIX etc
}

init
download_source $PROG $PROG $VER
if is_cross; then
    patch_source $PATCHDIR series.$BUILDARCH
else
    patch_source
fi
run_autoreconf -fi
prep_build
build

export TESTSUITE_FILTER='^ok |^test_|failed|^all tests'
(
    # The test SSH daemon needs root privileges to properly access PAM
    # on OmniOS. Sudo does not work well enough so use pfexec here.
    if [ `pfexec id -u` != "0" ]; then
        logerr "Your account is not set up for pfexec, cannot run testsuite"
    else
        export SUDO=pfexec
        SHELL=/bin/bash run_testsuite tests
    fi
)

# Remove the letter from VER for packaging
VER=${VER//p/.}

# Client package
make_package -seed $TMPDIR/manifest.client client.mog

# Server package
PKG=network/openssh-server
PKGE=$(url_encode $PKG)
SUMMARY="OpenSSH Server"
DESC="OpenSSH Secure Shell protocol Server"
RUN_DEPENDS_IPS="pkg:/network/openssh@$VER"
make_package -seed $TMPDIR/manifest.server server.mog

clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
