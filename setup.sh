#!/bin/sh

# pull
docker pull "mariadb" ;

# network
docker network create "mariadb" ;

# volume
docker volume create "mariadb" ;
ln -s "/var/lib/docker/volumes/mariadb" "/data/volume/" ;

# create
docker run --name "mariadb" \
	-p 3306:3306 \
	--network "mariadb" \
	-v "mariadb":"/var/lib/mariadb" \
	-e MARIADB_ROOT_PASSWORD="master" \
	--restart=always \
	-d "mariadb":"latest" ;

# start
docker start "mariadb" ;

# access
docker exec -it "mariadb" "/bin/bash"

# drop

docker rm --force "mariadb" ;
docker rmi --force "mariadb" ;
docker network rm --force "mariadb" ;
docker volume rm --force "mariadb" ;

rm -rfv "/var/lib/docker/volumes/mariadb" ;
rm -rfv "/data/volume/mariadb" ;

#
