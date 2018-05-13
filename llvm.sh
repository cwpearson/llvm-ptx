#! /bin/bash

set -eou pipefail -x



SRC_DIR=$HOME/Downloads/llvm-src
OBJ_DIR=$HOME/Downloads/llvm-build
INS_DIR=$HOME/software/toolchains/llvm-trunk

svn co http://llvm.org/svn/llvm-project/llvm/trunk $SRC_DIR

cd $SRC_DIR
REV=`svn info --show-item revision`
echo "LLVM trunk at rev $REV"

cd $SRC_DIR/tools
svn co http://llvm.org/svn/llvm-project/cfe/trunk@$REV clang
echo "  Got Clang"

cd $SRC_DIR/tools
svn co http://llvm.org/svn/llvm-project/lld/trunk@$REV lld
echo "  Got LLD"

cd $SRC_DIR/projects
svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk@$REV compiler-rt
echo "  Got compiler-rt"

cd $SRC_DIR/projects
svn co http://llvm.org/svn/llvm-project/openmp/trunk@$REV openmp
echo "  Got OpenMP"

cd $SRC_DIR/projects
svn co http://llvm.org/svn/llvm-project/libcxx/trunk@$REV libcxx
svn co http://llvm.org/svn/llvm-project/libcxxabi/trunk@$REV libcxxabi
echo "  Got libcxx/libcxxabi"

cd $SRC_DIR/tools/clang/tools
svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk@$REV extra
echo "  Got Clang tools"


mkdir -p $OBJ_DIR
cd $OBJ_DIR
cmake -G "Unix Makefiles" \
  -DCMAKE_INSTALL_PREFIX=$INS_DIR \
  -DCMAKE_BUILD_TYPE=Release $SRC_DIR \
  -DCMAKE_CXX_COMPILER=g++-6 \
  -DCMAKE_C_COMPILER=gcc-6

nice -n20 make -j$(nproc) install || nice -n20 make install