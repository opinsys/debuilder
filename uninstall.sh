#!/bin/sh

set -u

ROOT=/srv/opinsysbuilder

sudo service rebuildd-httpd stop
sudo service rebuildd stop

sudo rm -rf $ROOT
sudo rm /var/lib/rebuildd/rebuildd.db

sudo rm -f /etc/apache2/sites-available/opinsysbuilder
sudo rm -f /etc/apache2/sites-enabled/opinsysbuilder
