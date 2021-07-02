#!/bin/bash


docker stop myserver
docker rm myserver
docker rmi myserver
docker build -t myserver . 
docker run --env INDEX=off --rm --name myserver -d -p 80:80 -p 443:443 myserver
docker exec -ti myserver bash
