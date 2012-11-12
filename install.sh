#!/bin/sh

set -u

sudo service rebuildd-httpd stop
sudo service rebuildd stop

sudo rm -rf /var/packages
sudo rm /var/lib/rebuildd/rebuildd.db
sudo rm /usr/local/sbin/rebuildd_source_cmd
sudo rm /usr/local/sbin/rebuildd_build_cmd
sudo rm /usr/local/sbin/rebuildd_post_build_cmd

sudo rm -f /etc/apache2/sites-available/packages
sudo rm -f /etc/apache2/sites-enabled/packages

sudo mkdir -p /var/packages/conf
sudo mkdir -p /var/packages/incoming
sudo mkdir -p /var/packages/incomingtmp
sudo mkdir -p /var/packages/db
sudo mkdir -p /var/packages/logs

sudo cp reprepro/conf/distributions /var/packages/conf
sudo cp reprepro/conf/incoming /var/packages/conf

sudo cp apache2/packages /etc/apache2/sites-available
sudo ln -s /etc/apache2/sites-available/packages /etc/apache2/sites-enabled/packages

sudo cp rebuildd/bin/rebuildd_source_cmd /usr/local/sbin
sudo cp rebuildd/bin/rebuildd_build_cmd /usr/local/sbin
sudo cp rebuildd/bin/rebuildd_post_build_cmd /usr/local/sbin
sudo cp rebuildd/etc/default/rebuildd /etc/default
sudo cp rebuildd/etc/rebuildd/rebuilddrc /etc/rebuildd

sudo rebuildd init
sudo service rebuildd start
sudo service rebuildd-httpd start

cp dput/.dput.cf ~/
