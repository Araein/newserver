From debian:buster

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y nginx

COPY srcs/launch.sh ./
CMD bash launch.sh
EXPOSE 80
EXPOSE 443
