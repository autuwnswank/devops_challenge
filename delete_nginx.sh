#!/bin/bash
systemctl stop nginx;
systemctl disable nginx;
x=`apt purge nginx nginx-common nginx-core nginx-full -y --dry-run 2>/dev/null | awk '/^  /{print $1}' | grep -v Upgrading`;
echo $x;
apt purge nginx nginx-common nginx-core nginx-full -y;
apt autoremove $x -y;
echo "" > /etc/apt/sources.list.d/nginx.list
rm -rf /etc/nginx;
rm -rf /var/log/nginx;
rm -rf /var/cache/nginx;
rm -rf /var/www/html;
pkill -u carxadmin;
userdel -r carxadmin;
