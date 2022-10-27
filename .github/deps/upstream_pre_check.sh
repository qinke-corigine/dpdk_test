#!/bin/sh
set -x
export DPDK_CHECKPATCH_PATH=".github/deps/checkpatch.pl"
export DPDK_CHECKPATCH_CODESPELL=".github/deps/codespell-dpdk.txt"
./devtools/checkpatches.sh $1
./devtools/check-git-log.sh $1

#./devtools/test-meson-builds.sh
export RTE_TARGET=build
export RTE_SDK=`pwd`
if [ -d "./build" ]; then
        rm -rf ./build
fi
export PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig
CC=gcc meson -Denable_kmods=True -Dlibdir=lib  --default-library=static build
if [ -d "./build" ]; then
        ninja -C build
        echo "Build OK!!!!!"
        rm -rf build
fi

