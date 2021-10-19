#! /bin/sh

docker ps -a | awk '{ print $1,$2 }' | grep hiparco/mapfish-db:1.0 | awk '{print $1 }' | xargs -I {} docker rm -f {}
docker rmi hiparco/mapfish-db:1.0
docker build --tag=hiparco/mapfish-db:1.0 --rm=true .

