#! /bin/sh

docker run --name mapfish --hostname=mapfish --network=sisgeodef \
-v /etc/localtime:/etc/localtime:ro \
-v /srv/mapfish/:/usr/local/tomcat/webapps/ROOT/print-apps/ \
-e CATALINA_OPTS="-Ddb.name=mapfish -Ddb.host=mapfish-db -Ddb.username=postgres -Ddb.password=admin -Ddb.port=5432" \
-p 36510:8080 \
-d hiparco/mapfish:3.28



