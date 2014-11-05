#!/bin/bash

if [[ (`uname` == Linux) && (`uname -m` != armv6l) ]]
then
    export CC=gcc44
    export CXX=g++44
fi

if [ `uname` == Darwin ]; then
    export CXX='clang++ -std=c++11 -stdlib=libc++'
fi

export MACOSX_DEPLOYMENT_TARGET=10.7

./configure \
    --with-python=$SYS_PYTHON \
    --enable-optimized \
    --prefix=$PREFIX

make -j4
make install


if [ `uname` == Darwin ]; then
    # Make sure the symbolic paths are relative
    cd $PREFIX/bin
    rm llvm-ranlib
    ln -s llvm-ar llvm-ranlib
    cd - 
fi

rm -rf $PREFIX/docs
