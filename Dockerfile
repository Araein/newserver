From debian:buster

RUN apt-get update
#RUN apt-get upgrade
RUN apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install openssl
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline

COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./
COPY srcs/default ./
COPY srcs/launch.sh ./
CMD bash launch.sh

EXPOSE 80
EXPOSE 443
