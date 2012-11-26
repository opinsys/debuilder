#!/bin/sh

set -u

ROOT=/srv/debuilder

sudo service rebuildd-httpd stop
sudo service rebuildd stop

sudo rm -rf $ROOT
sudo rm /var/lib/rebuildd/rebuildd.db

sudo rm -f /etc/apache2/sites-available/debuilder
sudo rm -f /etc/apache2/sites-enabled/debuilder

sudo rm -f /etc/apt/sources.list.d/debuilder.list
