
service nginx start

#ssl 
mkdir /etc/nginx/ssl
mkdir /var/www/localhost

service rsync -av /var/www/html /var/www/localhost

openssl req -nodes -x509 -newkey  rsa:2048 -days 365 -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=127.0.0.1/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/certificate.localhost.crt 


mv ./default etc/nginx/sites-available
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*





mv ./bonjour.php /var/www/localhost

service php7.3-fpm start
service nginx restart
sleep infinity
