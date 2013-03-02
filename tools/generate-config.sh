#!/bin/sh

cat <<EOF > $1
## This file is POSIX shell fragment.

DEBUILDER_DISTS="lucid precise quantal"
DEBUILDER_ARCHS="i386 amd64"
DEBUILDER_SPOOLDIR="$2"
EOF
