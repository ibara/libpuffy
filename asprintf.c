/*
 * Public domain, Brian Callahan <bcallah@openbsd.org>, 2020
 */

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#include "puffy.h"

int
asprintf(char **ret, const char *format, ...)
{
	int retval;
	va_list ap;

	va_start(ap, format);

	if ((*ret = malloc(4096)) == NULL) {
		retval = -1;
		goto out;
	}

	if ((retval = vsprintf(*ret, format, ap)) > 4095)
		errx(1, "asprintf failed");

out:
	va_end(ap);

	return retval;
}
