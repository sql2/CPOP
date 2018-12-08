#!/bin/bash

docker stop mysql-master 2>&1
docker rm   mysql-master 2>&1

docker run --name mysql-master \
	--hostname mysql-master \
	--net marvel_dc \
	--ip 172.16.40.1 \
	--publish 3306:3306 \
	--detach \
	mysql-server

