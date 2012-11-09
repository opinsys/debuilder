#!/bin/sh

set -eu

# Create pbuilder chroots for each dist-arch pair.
for dist in lucid precise quantal
do
    for arch in i386 amd64
    do
	basetgz=/var/cache/pbuilder/$dist-$arch.tgz
	if [ ! -f $basetgz ]
	then
	    pbuilder \
		--create \
		--basetgz $basetgz \
		--architecture $arch \
		--distribution $dist
	fi
    done
done
