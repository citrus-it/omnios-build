#!/usr/bin/bash

# Load support functions
. ../../lib/functions.sh

PATH=/opt/gcc-4.6.2/bin:$PATH
export PATH
CC=gcc
CXX=g++

PROG=Python         # App name
VER=2.6.7           # App version
PVER=1              # Package Version
PKG=runtime/python-26 # Package name (without prefix)
SUMMARY="$PROG"
DESC="$SUMMARY"

DEPENDS_IPS="libgcc_s@4.6.2 library/zlib@1.2.6"

export CCSHARED="-fPIC"
CFLAGS="$CFLAGS -std=c99"
LDFLAGS32="-L/usr/gnu/lib -R/usr/gnu/lib"
LDFLAGS64="-L/usr/gnu/lib/amd64 -R/usr/gnu/lib/amd64"
CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses -D_LARGEFILE64_SOURCE"
CONFIGURE_OPTS="--enable-shared
	--with-system-ffi
	ac_cv_opt_olimit_ok=no
	ac_cv_olimit_ok=no"

preprep_build() {
    pushd $TMPDIR/$BUILDDIR > /dev/null || logerr "Cannot change to build directory"
    /opt/omni/bin/autoheader || logerr "autoheaer failed"
    /opt/omni/bin/autoconf || logerr "autoreconf failed"
    popd > /dev/null
}

post_config() {
    pushd $TMPDIR/$BUILDDIR > /dev/null || logerr "Cannot change to build directory"
    perl -pi -e 's/(^\#define _POSIX_C_SOURCE.*)/\/* $$1 *\//' pyconfig.h
    perl -pi -e 's/^(\#define _XOPEN_SOURCE.*)/\/* $$1 *\//' pyconfig.h
    perl -pi -e 's/^(\#define _XOPEN_SOURCE_EXTENDED.*)/\/* $$1 *\//' pyconfig.h
    popd > /dev/null
}

configure64() {
    logmsg "--- configure (64-bit)"
    CFLAGS="$CFLAGS $CFLAGS64" \
    CXXFLAGS="$CXXFLAGS $CXXFLAGS64" \
    CPPFLAGS="$CPPFLAGS $CPPFLAGS64" \
    LDFLAGS="$LDFLAGS $LDFLAGS64" \
    CC="$CC -m64" CXX=$CXX \
    logcmd $CONFIGURE_CMD $CONFIGURE_OPTS_64 \
    $CONFIGURE_OPTS || \
        logerr "--- Configure failed"
}

make_prog32() {
    post_config
    [[ -n $NO_PARALLEL_MAKE ]] && MAKE_JOBS=""
    logmsg "--- make"
    logcmd $MAKE $MAKE_JOBS DFLAGS=-32 || \
        logerr "--- Make failed"
}

make_prog64() {
    post_config
    [[ -n $NO_PARALLEL_MAKE ]] && MAKE_JOBS=""
    logmsg "--- make"
    logcmd $MAKE $MAKE_JOBS DFLAGS=-64 DESTSHARED=/usr/lib/python2.6/lib-dynload || \
        logerr "--- Make failed"
}

make_install32() {
    make_install
    rm $DESTDIR/usr/bin/i386/python || logerr "--- cannot remove arch hardlink"
    mv $DESTDIR/usr/lib/python2.6/config/Makefile $DESTDIR/usr/lib/python2.6/config/Makefile.32 || logerr "--- Makefile backup (32)"
}
make_install64() {
    logmsg "--- make install"
    logcmd $MAKE DESTDIR=${DESTDIR} install DESTSHARED=/usr/lib/python2.6/lib-dynload || \
        logerr "--- Make install failed"
    rm $DESTDIR/usr/bin/amd64/python || logerr "--- cannot remove arch hardlink"
    rm $DESTDIR/usr/lib/python2.6/config/libpython2.6.a || logerr "--- cannot remove static lib"
    (cd $DESTDIR/usr/bin && ln -s python2.6 python) ||  logerr "--- could not setup python softlink"
    mv $DESTDIR/usr/lib/python2.6/config/Makefile $DESTDIR/usr/lib/python2.6/config/Makefile.64 || logerr "--- Makefile backup (64)"
    mv $DESTDIR/usr/lib/python2.6/config/Makefile.32 $DESTDIR/usr/lib/python2.6/config/Makefile || logerr "--- Makefile restore (32)"
}

init
download_source $PROG $PROG $VER
patch_source
preprep_build
prep_build
build
make_isa_stub
strip_install -x
fix_permissions
make_package
clean_up
