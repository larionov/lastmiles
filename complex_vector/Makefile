
IDIR = .

CC=/usr/bin/cc

CFLAGS= -I$(IDIR) -std=iso9899:1999 -m64 -g -O0 \
	-fno-fast-math -fno-builtin -malign-double

CPPFLAGS=-D_TS_ERRNO -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE \
	-D_X_OPEN_SOURCE=600

DEPS = v.h

LIBS = -lm

SRCS = $(wildcard c*.c) line_plane_icept.c
OBJS = $(SRCS:.c=.o)

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) $(CPPFLAGS)

cplex_test: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(CPPFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) cplex_test
