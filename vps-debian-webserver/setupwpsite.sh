#!/usr/bin/env bash


sitename=$1

if [[ ! -d /var/www/html/$sitename ]]; then
	tempfile=$(mktemp --suffix=".tar.gz")

	curl -o $tempfile  https://wordpress.org/latest.tar.gz
	
	tar -xvzf $tempfile -C /var/www/html
	mv /var/www/html/wordpress /var/www/html/$sitename
	chown -R www-data:www-data /var/www/html/$sitename
	chmod -R 755 /var/www/html/$sitename
fi

#cat << EOF > /etc/nginx/conf.d/$sitename.conf
#server {
#        listen 80;
#        listen [::]:80;
#        root /var/www/html/$sitename;
#        index index.php index.html index.htm;
#        error_log /var/log/nginx/wordpress_error.log;
#        access_log /var/log/nginx/wordpres_access.log;
#        client_max_body_size 100M;
#        #include snippets/wordpress-secure.conf;
#        location / {
#                try_files \$uri \$uri/ /index.php?\$args;
#        }
#        location ~ \.php$ {
#                include snippets/fastcgi-php.conf;
#                fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
#                fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
#        }
#}
#EOF
#
##rm /etc/nginx/sites-enabled/default
#
#nginx -t
#
#systemctl reload nginx
#
