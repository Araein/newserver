
service nginx start

#ssl 
mkdir /etc/nginx/ssl
mkdir /var/www/localhost

service rsync -av /var/www/html /var/www/localhost

openssl req -nodes -x509 -newkey  rsa:2048 -days 365 -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=127.0.0.1/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/certificate.localhost.crt 

mv ./bonjour.php /var/www/localhost
mv ./default etc/nginx/sites-available
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*




service mysql start

#MARIADB
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin = 'mysql_native_password' where user='wordpress_user';" | mysql -u root




service mysql restart
service php7.3-fpm start
service nginx restart
sleep infinity
