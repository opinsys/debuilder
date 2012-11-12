#!/bin/sh

set -eu

ROOT=/srv/opinsysbuilder

sudo mkdir -p $ROOT/repo/conf
sudo mkdir -p $ROOT/repo/incoming
sudo mkdir -p $ROOT/repo/incomingtmp
sudo mkdir -p $ROOT/repo/db
sudo mkdir -p $ROOT/repo/logs
sudo mkdir -p $ROOT/bin

sudo cp repo/conf/* $ROOT/repo/conf

sudo cp apache2/opinsysbuilder /etc/apache2/sites-available
sudo ln -fs /etc/apache2/sites-available/opinsysbuilder /etc/apache2/sites-enabled/opinsysbuilder

sudo cp bin/* $ROOT/bin
sudo cp etc/default/rebuildd /etc/default
sudo cp etc/rebuildd/rebuilddrc /etc/rebuildd

sudo rebuildd init
sudo service rebuildd start
sudo service rebuildd-httpd start

