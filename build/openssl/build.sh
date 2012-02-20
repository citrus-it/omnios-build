#!/usr/bin/bash

# Load support functions
. ../../lib/functions.sh

PROG=openssl                 # App name
VER=1.0.0g                   # App version
PVER=1                       # Package Version (numeric only)
PKG=library/security/openssl # Package name (without prefix)
SUMMARY="$PROG - A toolkit for Secure Sockets Layer (SSL v2/v3) and Transport Layer (TLS v1) protocols and general purpose cryptographic library"
DESC="$SUMMARY"

DEPENDS_IPS="libgcc_s@4.6.2 library/zlib@1.2.6"

NO_PARALLEL_MAKE=1

make_prog() {
    [[ -n $NO_PARALLEL_MAKE ]] && MAKE_JOBS=""
    logmsg "--- make"
    # This will setup the internal runpath of libssl and libcrypto
    logcmd $MAKE $MAKE_JOBS SHARED_LDFLAGS="$SHARED_LDFLAGS" || \
        logerr "--- Make failed"
}

configure32() {
    if [ -n "`isalist | grep sparc`" ]; then
      SSLPLAT=solaris-sparcv8-cc
    else
      SSLPLAT=solaris-x86-gcc
    fi
    logmsg "--- Configure (32-bit) $SSLPLAT"
    logcmd ./Configure $SSLPLAT --pk11-libname=/usr/lib/libpkcs11.so.1 shared threads zlib enable-md2 --prefix=$PREFIX ||
        logerr "Failed to run configure"
    SHARED_LDFLAGS="-shared -Wl,-z,text"
}
configure64() {
    if [ -n "`isalist | grep sparc`" ]; then
      SSLPLAT=solaris64-sparcv9-cc
    else
      SSLPLAT=solaris64-x86_64-gcc
    fi
    logmsg "--- Configure (64-bit) $SSLPLAT"
    logcmd ./Configure $SSLPLAT --pk11-libname=/usr/lib/64/libpkcs11.so.1 shared threads zlib enable-md2 \
        --prefix=$PREFIX ||
        logerr "Failed ot run configure"
    SHARED_LDFLAGS="-m64 -shared -Wl,-z,text"
}

make_install() {
    logmsg "--- make install"
    logcmd make INSTALL_PREFIX=$DESTDIR install ||
        logerr "Failed to make install"
}

# Move installed libs from /usr/lib to /lib and make symlinks to match upstream package
move_libs() {
    logmsg "Relocating libs from usr/lib to lib"
    logcmd mv $DESTDIR/usr/lib/64 $DESTDIR/usr/lib/amd64
    logcmd mkdir -p $DESTDIR/lib/amd64
    logcmd mv $DESTDIR/usr/lib/lib* $DESTDIR/lib/ ||
        logerr "Failed to move libs (32-bit)"
    logcmd mv $DESTDIR/usr/lib/amd64/lib* $DESTDIR/lib/amd64/ ||
        logerr "Failed to move libs (64-bit)"
    logmsg "--- Making usr/lib symlinks"
    pushd $DESTDIR/usr/lib > /dev/null
    logcmd ln -s /lib/libssl.so.1.0.0 libssl.so
    logcmd ln -s /lib/libssl.so.1.0.0 libssl.so.1.0.0
    logcmd ln -s /lib/libcrypto.so.1.0.0 libcrypto.so
    logcmd ln -s /lib/libcrypto.so.1.0.0 libcrypto.so.1.0.0
    popd > /dev/null
    pushd $DESTDIR/usr/lib/amd64 > /dev/null
    logcmd ln -s /lib/amd64/libssl.so.1.0.0 libssl.so
    logcmd ln -s /lib/amd64/libssl.so.1.0.0 libssl.so.1.0.0
    logcmd ln -s /lib/amd64/libcrypto.so.1.0.0 libcrypto.so
    logcmd ln -s /lib/amd64/libcrypto.so.1.0.0 libcrypto.so.1.0.0
    popd > /dev/null
}


# Turn the letter component of the version into a number for IPS versioning
ord26() {
    local ASCII=$(printf '%d' "'$1")
    ASCII=$((ASCII - 64))
    [[ $ASCII -gt 32 ]] && ASCII=$((ASCII - 32))
    echo $ASCII
}

save_function make_package make_package_orig
make_package() {
    if [[ -n "$USEIPS" ]]; then
        NUMVER=${VER::$((${#VER} -1))}
        ALPHAVER=${VER:$((${#VER} -1))}

        VER=${NUMVER}.$(ord26 ${ALPHAVER}) \
        make_package_orig
    else
        make_package_orig
    fi
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
move_libs
make_isa_stub
fix_permissions
make_package
clean_up
