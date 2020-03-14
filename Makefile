# libpuffy Makefile

CC ?=		cc
CFLAGS ?=	-O2 -pipe
CFLAGS +=	-I.

PREFIX ?=	/usr/local

LIB =	libpuffy.a
OBJS =	asprintf.o e_atan2.o e_exp.o e_fmod.o e_log.o e_log10.o e_pow.o e_rem_pio2.o e_sqrt.o err.o errc.o errx.o \
	explicit_bzero.o fgetln.o fmt_scaled.o fnmatch.o fts.o getbsize.o k_cos.o k_rem_pio2.o k_sin.o ldexp.o modf.o ohash.o pwd.o \
	reallocarray.o recallocarray.o s_atan.o s_cos.o s_fabs.o s_floor.o s_scalbn.o s_sin.o setmode.o strlcat.o strlcpy.o \
	strmode.o strtonum.o unveil.o verr.o verrc.o verrx.o vis.o vwarn.o vwarnc.o vwarnx.o warn.o warnc.o warnx.o

all: ${OBJS}
	${AR} cr ${LIB} ${OBJS}
	ranlib ${LIB}

install:
	install -c -m 444 ${LIB} ${DESTDIR}${PREFIX}/lib
	install -c -m 444 fnmatch.h fts.h ohash.h puffy.h tree.h vis.h ${DESTDIR}${PREFIX}/include

clean:
	rm -f ${LIB} ${OBJS}
