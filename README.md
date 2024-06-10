# Docker - MariaDB

Database popular among developers.

#### Get container **pull**.

```console
docker pull "mariadb"
```

#### Create **network** for data.

```console
docker network create "mariadb"
```

#### Create **volume** for data.

```console
docker volume create "mariadb"
ln -s "/var/lib/docker/volumes/mariadb" "/data/volume/"
```

#### Create and **run** container.

```console
docker run --name "mariadb" \
	-p 3306:3306 \
	--network "mariadb" \
	-v "mariadb":"/var/lib/mariadb" \
	-e MARIADB_ROOT_PASSWORD="master" \
	--restart=always \
	-d "mariadb":"latest"
```

> Database access "MARIADB_ROOT_PASSWORD".

#### Start container.

```console
docker start "mariadb"
```

#### Access container.

```console
docker exec -it "mariadb" "/bin/bash"
```
