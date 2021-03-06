#!/usr/bin/env bash
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

set -ex

cd /build

export PATH=/tools/${TOOLCHAIN}/bin:/tools/host/bin:$PATH

tar -xf readline-${READLINE_VERSION}.tar.gz

pushd readline-${READLINE_VERSION}

CLFAGS="${EXTRA_TARGET_CFLAGS} -fPIC" CPPFLAGS="${EXTRA_TARGET_CFLAGS} -fPIC" LDFLAGS="-L/tools/deps/lib" \
    ./configure \
        --build=${BUILD_TRIPLE} \
        --host=${TARGET_TRIPLE} \
        --prefix=/tools/deps \
        --disable-shared \
        --with-curses

make -j `nproc`
make -j `nproc` install DESTDIR=/build/out
