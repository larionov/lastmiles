#!/bin/bash

unset LD_FLAGS

unset AR
unset AS
unset BUILD
unset CC
unset CFLAGS
unset CONFIG_SHELL
unset CPPFLAGS
unset CXX
unset CXXFLAGS
unset EDITOR
unset GREP
unset JRE_HOME
unset LANG
unset LC_ALL
unset LC_COLLATE
unset LC_CTYPE
unset LC_MESSAGES
unset LC_MONETARY
unset LC_NUMERIC
unset LC_TIME
unset LD
unset LD_LIBRARY_PATH
unset LD_OPTIONS
unset LD_RUN_PATH
unset LIBTOOL
unset M4
unset MACHTYPE
unset MAKE
unset MANPATH
unset NM
unset OPENSSL_SOURCE
unset OSTYPE
unset PAGER
unset PERL
unset PKG_CONFIG_PATH
unset SED
unset SHELL
unset SRC
unset STD_CDEFINES
unset VISUAL
unset XTERM_LOCALE

LANG=C
export LANG

unset LC_ALL

LC_COLLATE=C
export LC_COLLATE

LC_CTYPE=C
export LC_CTYPE

LC_MESSAGES=C
export LC_MESSAGES

LC_MONETARY=C
export LC_MONETARY

LC_NUMERIC=C
export LC_NUMERIC

LC_TIME=C
export LC_TIME

CC=/usr/bin/cc
export CC

CFLAGS=\-std=iso9899:1999\ \-fno-builtin\ \-g\ \-march=armv7-a\ \
\-mtune=cortex-a17\ \-mfpu=vfpv4-d16\ \
\-mstructure-size-boundary=32\ \-marm\ \-mtls-dialect=gnu2\ \
\-pedantic\ \-mno-sched-prolog\ \-mlittle-endian
export CFLAGS

CPPFLAGS=\-D_TS_ERRNO\ \-D_POSIX_PTHREAD_SEMANTICS\ \
\-D_LARGEFILE64_SOURCE\ \-D_X_OPEN_SOURCE=600
export CPPFLAGS

LDFLAGS=\-Wl,-rpath=/opt/bw/lib,--enable-new-dtags
export LDFLAGS

LD_OPTIONS=\-L/opt/bw/lib
export LD_OPTIONS

LD_RUN_PATH=/opt/bw/lib
export LD_RUN_PATH

unset M4

unset MAKE

MANPATH=/usr/local/share/man:/usr/local/man:/usr/local/share/man:/usr/local/man:/usr/share/man:/opt/schily/share/man
export MANPATH

PATH=/usr/local/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
export PATH

PKG_CONFIG_PATH=/opt/bw/lib/pkgconfig
export PKG_CONFIG_PATH

RUNPATH=/opt/bw/lib
export RUNPATH

SHELL=/bin/bash
export SHELL

unset SRC

TZ=GMT0
export TZ

XTERM_LOCALE=C; export XTERM_LOCALE

unset LD_LIBRARY_PATH
unset CFLAGS_SOCKETS
unset POSIXLY_CORRECT
unset PHP

# AR=/usr/bin/ar ; export AR
# AS=/usr/bin/as ; export AS
# GREP=/bin/grep ; export GREP
# LD=/usr/bin/ld ; export LD
# NM=/usr/bin/nm\ \-p; export NM
# MAKE=/usr/bin/make ; export MAKE
# PERL=/usr/bin/perl ; export PERL
# SED=/bin/sed ; export SED

unset CXXFLAGS
unset LD_LIBRARY_PATH
unset LIBTOOL
unset CFLAGS_SOCKETS
unset POSIXLY_CORRECT
unset PHP

TMPDIR=/var/tmp/`( /usr/bin/id | /usr/bin/cut -f2 -d\( | /usr/bin/cut -f1 -d\) )`
export TMPDIR

if [ ! -d $TMPDIR ]; then
    /usr/bin/printf "INFO : no TMPDIR exists in /var/tmp/$USERNAME\n"
    mkdir -m 0750 $TMPDIR
    if [ ! -d $TMPDIR ]; then
        /usr/bin/printf "FAIL : could not create a TMPDIR\n"
        exit 1
    fi
    /usr/bin/printf "INFO : new TMPDIR created\n"
else
    chmod 0750 $TMPDIR
    touch $TMPDIR/foo_$$
    if [ ! -f $TMPDIR/foo_$$ ]; then
        /usr/bin/printf "FAIL : could not create a file in TMPDIR\n"
        exit 1
    fi
    rm $TMPDIR/foo_$$
fi

$CC $CFLAGS $CPPFLAGS -I/opt/bw/include -c -o box.o box.c

$CC $CFLAGS $CPPFLAGS -I/opt/bw/include -c -o create_borderless_topwin.o create_borderless_topwin.c
$CC $CFLAGS $CPPFLAGS -I/opt/bw/include -c -o create_gc.o create_gc.c

$CC $CFLAGS $CPPFLAGS -L/opt/bw/lib -o box box.o create_borderless_topwin.o create_gc.o -lX11

ls -lapb --full-time *.o box

$CC $CFLAGS $CPPFLAGS -L/opt/bw/lib -o simple_grid simple_grid.c -lX11

ls -lapb --full-time simple_grid
