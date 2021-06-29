From debian:buster



COPY srcs/launch.sh ./
CMD bash launch.sh
EXPOSE 80
EXPOSE 443

