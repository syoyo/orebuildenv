#!/bin/sh

# sha1sums
premake4_sha1sum="b86e5e71d00694ad7c83dc320a60ca91fc77113f  build/macosx/bin/premake4"

function build_premake4() {
  mkdir -p src
  rm -rf src/premake-4.4-beta4
  unzip dist/premake-4.4-beta4-src.zip -d src
  (cd src/premake-4.4-beta4/build/gmake.macosx; make)
  
  mkdir -p build
  mkdir -p build/macosx
  mkdir -p build/macosx/bin
  cp src/premake-4.4-beta4/bin/release/premake4 build/macosx/bin
  echo ${premake4_sha1sum} >> PREMAKE4.sum
  sha1sum --check PREMAKE4.sum || die
  rm PREMAKE4.sum

  return 0
}

function build_nodejs() {
  mkdir -p src
  rm -rf src/node-v0.6.14
  tar -zxvf dist/node-v0.6.14.tar.gz -C src
  (cd src/node-v0.6.14; ./configure && make)
  cp src/node-v0.6.14/out/Release/node build/macosx/bin
}

build_premake4
build_nodejs
