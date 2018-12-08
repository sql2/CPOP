#!/bin/bash

docker stop mysql-slave1 2>&1
docker rm   mysql-slave1 2>&1

docker run --name mysql-slave1 \
	--hostname mysql-slave1 \
	--net marvel_dc \
	--ip 172.16.40.2 \
	--publish 3307:3306 \
	--detach \
	mysql-server

