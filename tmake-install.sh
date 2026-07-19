#!/bin/sh

install_file () {
	if grep -r "include \$(TMAKE_DIR)/$1" > /dev/null; then
		echo "installing $1 ..."
		cp "$TMAKE_SRC/$1" "make/"
	fi
}

THIS="$(realpath "$0")"
TMAKE_SRC="$(dirname "$THIS")/make"

echo "tmake src is $TMAKE_SRC"

if test -n "$1" ; then
	cd "$1" || exit 1
fi


# reset tmake dir
mkdir -p "make"
rm -f make/tmake-*.mk

# install tmake files
# keep this in dependencies order
for FILE in \
	"tmake-init.mk" \
	"tmake-version.mk" \
	"tmake-prog.mk" \
	"tmake-lib.mk" \
	"tmake-files.mk" \
	"tmake-subdir.mk" \
	"tmake-compile.mk" \
; do
	install_file "$FILE"
done
