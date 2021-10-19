#! /bin/sh

docker ps -a | awk '{ print $1,$2 }' | grep hiparco/mapfish:3.28 | awk '{print $1 }' | xargs -I {} docker rm -f {}
docker rmi hiparco/mapfish:3.28
docker build --tag=hiparco/mapfish:3.28 --rm=true .

