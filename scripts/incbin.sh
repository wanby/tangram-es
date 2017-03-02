: incbin - A utility for including binary files in C source.
:          Given a binary file and a C symbol name, generates
:          a .h or .c file with that binary data stored as an
:          array of unsigned chars.
:
:          This script has no non-standard dependencies and runs
:          on both Windows and UNIX.
:
:          http://github.com/rmitton/incbin
:
: Usage:
: UNIX:    sh incbin.bat myfile.bin output.h symbolname
:
:          ; if false ; then #lolwut
#!/bin/bash

set -e

usage () {
	echo Usage: incbin input.bin output.h symbolname
	exit 1
}

[ -z "$1" ] && usage
[ -z "$2" ] && usage
[ -z "$3" ] && usage
bytes=`od -An -t x1 -v "$1"`

(
	echo "/* Generated by incbin */"
	echo
	echo "#include <stddef.h>"
	echo
	echo "const unsigned char $3_data[] = {"

	offset=0 ; count=16
	for val in $bytes ; do
		if [ $count -eq 16 ] ; then
			if [ $offset -ne 0 ] ; then
				echo ,
			fi
			printf "/*%08x*/ " $offset
			count=0
		else
			printf ,
		fi
		printf 0x$val

		offset=$(($offset+1)) ; count=$(($count+1))
	done
	echo
	echo "};"
	echo
	echo "const size_t $3_size = sizeof($3_data);"
) > "$2"

