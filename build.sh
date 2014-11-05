#!/bin/bash

if [ `uname` == Darwin ]; then
    export CXX='clang++ -std=c++11 -stdlib=libc++'
    export MACOSX_DEPLOYMENT_TARGET=10.7
fi

./configure \
    --with-python=$SYS_PYTHON \
    --enable-optimized \
    --prefix=$PREFIX

make -j4
make install

rm -rf $PREFIX/docs
