#!/bin/bash


docker stop monconteneur
docker rm monconteneur
docker image rm monimage
docker build -t monimage .
docker run -d -p 80:80 --name=monconteneur monimage
docker exec -ti monconteneur bash
