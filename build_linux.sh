#!/bin/sh

# sha1sums
premake4_sha1sum="b86e5e71d00694ad7c83dc320a60ca91fc77113f  build/linux/bin/premake4"

mkdir -p src
rm -rf src/premake-4.4-beta4
unzip dist/premake-4.4-beta4-src.zip -d src
(cd src/premake-4.4-beta4/build/gmake.unix; make)

mkdir -p build
mkdir -p build/linux
mkdir -p build/linux/bin
cp src/premake-4.4-beta4/bin/release/premake4 build/linux/bin
echo ${premake4_sha1sum} >> PREMAKE4.sum
sha1sum --check PREMAKE4.sum || die
rm PREMAKE4.sum
