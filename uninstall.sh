#!/bin/sh

set -u

ROOT=/srv/debuilder

service rebuildd-httpd stop
service rebuildd stop

rm -rf $ROOT

rm -f /etc/apache2/sites-available/debuilder
rm -f /etc/apache2/sites-enabled/debuilder

rm -f /etc/apt/sources.list.d/debuilder.list
