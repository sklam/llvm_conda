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
    --enable-pic=yes \
    --enable-optimized=yes \
    --enable-shared $TARGET \
    --prefix=$PREFIX
make
make install

if [ `uname` == Darwin ]; then
    # FIXME3.5: This script needs to handle renaming symlinks to other renamed files
    $SYS_PYTHON $RECIPE_DIR/rename_bin_osx.py
fi

rm -rf $PREFIX/docs
