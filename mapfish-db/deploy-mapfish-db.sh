#! /bin/sh

docker run --name mapfish-db --hostname=mapfish-db --network=sisgeodef \
-v /etc/localtime:/etc/localtime:ro \
-e POSTGRES_PASSWORD=admin \
-e POSTGRES_DB=mapfish \
-v /srv/mapfish-db/:/var/lib/postgresql/data/ \
-p 36511:5432 \
-d hiparco/mapfish-db:1.0



