#!/bin/sh

set -eu

ROOT=/srv/debuilder

mkdir -p $ROOT/repo/conf
mkdir -p $ROOT/repo/incoming
mkdir -p $ROOT/repo/incomingtmp
mkdir -p $ROOT/repo/db
mkdir -p $ROOT/repo/logs
mkdir -p $ROOT/bin

cp repo/conf/* $ROOT/repo/conf

cp apache2/debuilder /etc/apache2/sites-available
ln -fs /etc/apache2/sites-available/debuilder /etc/apache2/sites-enabled/debuilder

cp bin/* $ROOT/bin
cp etc/default/rebuildd /etc/default
cp etc/rebuildd/rebuilddrc /etc/rebuildd

cp apt/debuilder.list /etc/apt/sources.list.d

rebuildd init
service rebuildd start
service rebuildd-httpd start
