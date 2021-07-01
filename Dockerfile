From debian:buster

RUN apt-get update
#RUN apt-get upgrade
RUN apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install openssl

COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./
COPY srcs/default ./
COPY srcs/launch.sh ./
CMD bash launch.sh

EXPOSE 80
EXPOSE 443
