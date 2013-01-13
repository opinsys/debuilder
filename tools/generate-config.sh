#!/bin/sh

cat <<EOF > $1
## This file is POSIX shell fragment.

dists="wheezy"
archs="i386 amd64"
spooldir="$2"
EOF
