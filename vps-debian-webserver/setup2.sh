#!/usr/bin/env bash
#
#


apt install unzip pwgen nginx
#php8.3 php8.3-common php8.3-mysql php8.3-gmp php8.3-curl php8.3-intl php8.3-mbstring php8.3-xmlrpc php8.3-gd php8.3-xml php8.3-cli php8.3-zip
systemctl status nginx
ss -natp
apt-get install php php-common php-gmp php-xml php-cli php-zip php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip mariadb-server mariadb-client
systemctl status mariadb
ss -natp
systemctl status php8.3-fpm.service
mysql_secure_installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /etc/local/bin
mv wp-cli.phar /usr/local/bin
ln -s /usr/local/bin/wp-cli.phar /usr/local/bin/wp-cli
