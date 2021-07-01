
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
echo "CREATE DATABASE IF NOT EXISTS wordpress;"  | mysql -u root --skip-password
#echo "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'wpuser';"
#echo "GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'localhost';"
#echo "FLUSH PRIVILEGES;"
echo "GRANT ALL ON wordpress.* TO 'wpuser'@'localhost' IDENTIFIED BY 'wpuser';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
#echo "update mysql.user set plugin = 'mysql_native_password' where user='wpuser';" | mysql -u root




#myphpadmin 

wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
    tar -xzvf phpMyAdmin-5.0.2-english.tar.gz
    mv -f phpMyAdmin-5.0.2-english/ /var/www/localhost/phpmyadmin
 #   rm -rf phpMyAdmin-5.0.2-english.tar.gz
mv -f config.inc.php /var/www/localhost/phpmyadmin

#wordpress 


#wget https://wordpress.org/latest.tar.gz
#tar -xzvf latest.tar.gz
#    mv wordpress/ /var/www/localhost/
#    rm -rf latest.tar.gz
#mv -f wp-config.php /var/www/localhost/wordpress


#chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
#chown -R www-data:www-data /var/www/localhost/*
#chmod -R 755 /var/www/*


service mysql restart
service php7.3-fpm restart
service nginx restart
sleep infinity
