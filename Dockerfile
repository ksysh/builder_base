# Check https://apt.llvm.org/
FROM ubuntu:18.04

ARG CLANG_VER=8

RUN true \
  && apt-get update \
  && apt-get install -y build-essential curl \
  && curl https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
  && echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-$CLANG_VER main" | tee -a /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y clang-$CLANG_VER lld-$CLANG_VER
