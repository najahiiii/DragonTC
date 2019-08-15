#!/usr/bin/env bash
git clone https://github.com/dragon-tc-tmp/build --depth=1 build
git clone https://github.com/llvm/llvm-project --depth=1 llvm-project
git clone https://github.com/najahiiii/binutils -b 2.32 --depth=1 llvm-project/llvm/tools/binutils
cd build || exit 1
bash build_dtc 10.0
export TOOLCHAIN_ROOT="$(dirname "$(pwd)")"
export DTC_VERSION=10.0
export PREFIX_PATH=$TOOLCHAIN_ROOT/out/$DTC_VERSION
git config --global user.email "najahiii@outlook.co.id"
git config --global user.name "Ahmad Thoriq Najahi"
cd $PREFIX_PATH
if ! [ -a lib64/libomp.so.5 ]; then
    echo "linking libomp.so"
    cd lib64
    ln -s libomp.so libomp.so.5
    cd ..
fi
chmod -R 777 $PREFIX_PATH
git init
git checkout -b daily/10.0
git add .
git commit -m "[daily]: $DTC_VERSION-DragonTC-$(date +'%d%m%y')" --signoff
git remote add origin https://najahiiii:$GIT_TOKEN@github.com/NusantaraDevs/DragonTC.git
git push --force origin daily/10.0

