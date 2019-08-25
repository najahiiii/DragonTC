#!/usr/bin/env bash
git clone https://github.com/najahiiii/Noob-Script.git -b build --depth=1 build
git clone https://github.com/NusantaraDevs/llvm-project --depth=1 llvm-project
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
git checkout -b 10.0
git add .
git commit -m "$DTC_VERSION-NusantaraDevsTC-$(date +'%d%m%y')" --signoff
git remote add origin https://najahiiii:$GIT_TOKEN@github.com/NusantaraDevs/clang.git
git push --force origin 10.0
