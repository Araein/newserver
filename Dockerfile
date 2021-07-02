From debian:buster

RUN apt-get update
#RUN apt-get upgrade
RUN apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install openssl
#RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get install vim -y
RUN apt-get install mariadb-server mariadb-client -y
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get install -y php-mbstring php-zip php-gd php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip



COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./
COPY srcs/default ./
COPY srcs/launch.sh ./
COPY srcs/bonjour.php ./


#RUN mkdir ~/mkcert && cd ~/mkcert && \
	#wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 && \
	#mv mkcert-v1.4.1-linux-amd64 mkcert && chmod +x mkcert && \
	#./mkcert -install && ./mkcert localhost

CMD bash launch.sh

EXPOSE 80
EXPOSE 443
