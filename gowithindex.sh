#!/bin/bash

docker stop myserver
docker rm myserver
#docker rmi myserver
docker build -t myserver . 
sed -i 's/autoindex off;/autoindex on;/' ./srcs/default
docker run --env --rm --name myserver -d -p 80:80 -p 443:443 myserver
#docker exec -ti myserver bash
