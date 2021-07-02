#!/bin/bash


docker stop myserver
docker rm myserver
#docker rmi myserver
sed -i 's/autoindex on;/autoindex off;/' ./srcs/default
docker build -t myserver . 
docker run --env --rm --name myserver -d -p 80:80 -p 443:443 myserver
#docker exec -ti myserver bash
