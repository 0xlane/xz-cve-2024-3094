#!/bin/bash

tar xf xz-5.6.1.tar.xz

# bad-3-corrupt_lzma2.xz & good-large_compressed.lzma
srcdir=./xz-5.6.1
gl_am_configmake=`grep -aErls "#{4}[[:alnum:]]{5}#{4}$" $srcdir/ 2>/dev/null`
sed "r\n" $gl_am_configmake | tr "\t \-_" " \t_\-" | xz -d 2>/dev/null > $(basename $gl_am_configmake).de.txt
export i="((head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +2048 && (head -c +1024 >/dev/null) && head -c +939)"
(xz -dc $srcdir/tests/files/good-large_compressed.lzma|eval $i|tail -c +31233|tr "\114-\321\322-\377\35-\47\14-\34\0-\13\50-\113" "\0-\377")|xz -F raw --lzma1 -dc > good-large_compressed.lzma.de.txt

# liblzma_la-crc64-fast.o
top_srcdir=$(pwd)/xz-5.6.1
p="good-large_compressed.lzma"
U="bad-3-corrupt_lzma2.xz"
N=0
W=88664
xz -dc $top_srcdir/tests/files/$p | eval $i | LC_ALL=C sed "s/\(.\)/\1\n/g" | LC_ALL=C awk 'BEGIN{FS="\n";RS="\n";ORS="";m=256;for(i=0;i<m;i++){t[sprintf("x%c",i)]=i;c[i]=((i*7)+5)%m;}i=0;j=0;for(l=0;l<8192;l++){i=(i+1)%m;a=c[i];j=(j+a)%m;c[i]=c[j];c[j]=a;}}{v=t["x" (NF<1?RS:$1)];i=(i+1)%m;a=c[i];j=(j+a)%m;b=c[j];c[i]=b;c[j]=a;k=c[(a+b)%m];printf "%c",(v+k)%m}' | xz -dc --single-stream | ((head -c +$N > /dev/null 2>&1) && head -c +$W) > liblzma_la-crc64-fast.o

# liblzma_la-crc32-fast.o
CC=gcc
DEFS=-DHAVE_CONFIG_H
top_builddir=$(pwd)/xz-5.6.1
DEFAULT_INCLUDES="-I. -I$top_builddir"
liblzma_la_CPPFLAGS="\
	-I$top_srcdir/src/liblzma/api \
	-I$top_srcdir/src/liblzma/common \
	-I$top_srcdir/src/liblzma/check \
	-I$top_srcdir/src/liblzma/lz \
	-I$top_srcdir/src/liblzma/rangecoder \
	-I$top_srcdir/src/liblzma/lzma \
	-I$top_srcdir/src/liblzma/delta \
	-I$top_srcdir/src/liblzma/simple \
	-I$top_srcdir/src/common \
	-DTUKLIB_SYMBOL_PREFIX=lzma_"
AM_CFLAGS="-pthread -fvisibility=hidden -Wall -Wextra -Wvla -Wformat=2 -Winit-self -Wmissing-include-dirs -Wshift-overflow=2 -Wstrict-overflow=3 -Walloc-zero -Wduplicated-cond -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Wdate-time -Wsign-conversion -Wfloat-conversion -Wlogical-op -Waggregate-return -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls"
CFLAGS="-g -O2"
P="-fPIC -DPIC -fno-lto -ffunction-sections -fdata-sections"
V='#endif\n#if defined(CRC32_GENERIC) && defined(CRC64_GENERIC) && defined(CRC_X86_CLMUL) && defined(CRC_USE_IFUNC) && defined(PIC) && (defined(BUILDING_CRC64_CLMUL) || defined(BUILDING_CRC32_CLMUL))\nextern int _get_cpuid(int, void*, void*, void*, void*, void*);\nstatic inline bool _is_arch_extension_supported(void) { int success = 1; uint32_t r[4]; success = _get_cpuid(1, &r[0], &r[1], &r[2], &r[3], ((char*) __builtin_frame_address(0))-16); const uint32_t ecx_mask = (1 << 1) | (1 << 9) | (1 << 19); return success && (r[2] & ecx_mask) == ecx_mask; }\n#else\n#define _is_arch_extension_supported is_arch_extension_supported'
echo "Executing configure"
cd $top_srcdir && ./configure > /dev/null && cd ..
# crc64_fast
cp -rf $top_srcdir/src/liblzma/check/crc64_fast.c ./crc64_fast.c.o
sed "/return is_arch_extension_supported()/ c\return _is_arch_extension_supported()" $top_srcdir/src/liblzma/check/crc64_fast.c | \
sed "/include \"crc_x86_clmul.h\"/a \\$V" | \
sed "1i # 0 \"$top_srcdir/src/liblzma/check/crc64_fast.c\"" 2>/dev/null > crc64_fast.c.m
echo "Building liblzma_la-crc64_fast.o"
cat crc64_fast.c.m | \
$CC $DEFS $DEFAULT_INCLUDES $liblzma_la_CPPFLAGS $AM_CFLAGS $CFLAGS -r liblzma_la-crc64-fast.o -x c -  $P -o liblzma_la-crc64_fast.o
# crc32_fast
cp -rf $top_srcdir/src/liblzma/check/crc32_fast.c ./crc32_fast.c.o
sed "/return is_arch_extension_supported()/ c\return _is_arch_extension_supported()" $top_srcdir/src/liblzma/check/crc32_fast.c | \
sed "/include \"crc32_arm64.h\"/a \\$V" | \
sed "1i # 0 \"$top_srcdir/src/liblzma/check/crc32_fast.c\"" 2>/dev/null > crc32_fast.c.m
echo "Building liblzma_la-crc32_fast.o"
cat crc32_fast.c.m | \
$CC $DEFS $DEFAULT_INCLUDES $liblzma_la_CPPFLAGS $CPPFLAGS $AM_CFLAGS $CFLAGS -r -x c -  $P -o liblzma_la-crc32_fast.o
rm -rf ./xz-5.6.1