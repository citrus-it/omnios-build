#!/usr/bin/bash
#
# {{{ CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END }}}
#
# Copyright 2016 OmniTI Computer Consulting, Inc.  All rights reserved.
# Copyright 2025 OmniOS Community Edition (OmniOSce) Association.
#
. ../../lib/build.sh

PROG=iperf
VER=3.19
PKG=network/test/iperf
SUMMARY="iperf network testing tool"
DESC="A tool for active measurements of the maximum achievable bandwidth on "
DESC+="IP networks"

DEPENDS_IPS="system/library"

set_arch 64

XFORM_ARGS+=" -DPREFIX=${PREFIX#/}"

CONFIGURE_OPTS="
    --bindir=$PREFIX/bin
    --disable-static
"

LDFLAGS="-lsocket -lnsl"
SKIP_LICENCES=iperf

pre_build() {
    if cross_arch $1; then
        MAKE_ARGS+=" noinst_PROGRAMS= "
        MAKE_INSTALL_ARGS+=" noinst_PROGRAMS= "
    fi
}

init
download_source $PROG $VER
patch_source
prep_build
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
