
service nginx start

#ssl 
mkdir /etc/nginx/ssl
openssl req -nodes -x509 -newkey  rsa:2048 -days 365 -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=127.0.0.1/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/certificate.localhost.crt 


mv ./default etc/nginx/sites-available




sleep infinity
