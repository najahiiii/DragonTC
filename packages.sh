#!/usr/bin/env bash
apt-get install -y \
          git \
          gperf \
          bison \
          bc \
          flex \
          texinfo \
          help2man \
          make \
          libncurses5-dev \
          autoconf \
          automake \
          libtool \
          libtool-bin \
          gawk \
          wget \
          bzip2 \
          xz-utils \
          unzip \
          patch \
          python3 \
          libstdc++6 \
          subversion \
          cmake \
          autogen \
          autotools-dev \
          shtool \
          python \
          m4 \
          zlib1g-dev \
          binfmt-support \
          llvm \
          llvm-dev \
          clang
apt-get remove -y gcc g++
apt-get autoremove -y
