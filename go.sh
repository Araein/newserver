#!/bin/bash


docker stop myserver
docker rm myserver
docker rmi myserver
#docker build -t monimage .
#docker run -d -p 80:80 --name=monconteneur monimage
#docker exec -ti monconteneur bash

docker build -t myserver . 
docker run --rm --name myserver -d -p 80:80 -p 443:443 myserver
docker exec -ti myserver bash
