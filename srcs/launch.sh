
service nginx start

#ssl 
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=emma/CN=localhost"

openssl req -nodes -x509 -newkey  rsa:2048 -days 365 -subj "/C=FR/ST=France/L=Paris/O=42/OU=127.0.0.1" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/certificate.localhost.crt 
mv ./default etc/nginx/sites-available


sleep infinity
