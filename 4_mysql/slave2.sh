#!/bin/bash

docker stop mysql-slave2 2>&1
docker rm   mysql-slave2 2>&1

docker run --name mysql-slave2 \
	--hostname mysql-slave2 \
	--net marvel_dc \
	--ip 172.16.40.3 \
	--publish 3308:3306 \
	--detach \
	mysql-server

