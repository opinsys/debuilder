#!/bin/sh

set -u

ROOT=/srv/opinsysbuilder

sudo service rebuildd-httpd stop
sudo service rebuildd stop

sudo rm -rf $ROOT
sudo rm /var/lib/rebuildd/rebuildd.db

sudo rm -f /etc/apache2/sites-available/opinsysbuilder
sudo rm -f /etc/apache2/sites-enabled/opinsysbuilder

sudo mkdir -p $ROOT/repo/conf
sudo mkdir -p $ROOT/repo/incoming
sudo mkdir -p $ROOT/repo/incomingtmp
sudo mkdir -p $ROOT/repo/db
sudo mkdir -p $ROOT/repo/logs
sudo mkdir -p $ROOT/bin

sudo cp repo/conf/distributions $ROOT/repo/conf
sudo cp repo/conf/incoming $ROOT/repo/conf

sudo cp apache2/opinsysbuilder /etc/apache2/sites-available
sudo ln -s /etc/apache2/sites-available/opinsysbuilder /etc/apache2/sites-enabled/opinsysbuilder

sudo cp bin/* $ROOT/bin
sudo cp etc/default/rebuildd /etc/default
sudo cp etc/rebuildd/rebuilddrc /etc/rebuildd

sudo rebuildd init
sudo service rebuildd start
sudo service rebuildd-httpd start

cp dput/.dput.cf ~/
