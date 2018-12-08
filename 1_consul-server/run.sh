#!/bin/bash

docker stop consul-server 2>&1
docker rm   consul-server 2>&1

docker run --name consul-server \
	--hostname consul-server \
	--net marvel_dc \
	--ip 172.16.10.1 \
	--publish 8300:8300 \
	--publish 8301:8301 \
	--publish 8301:8301/udp \
	--publish 8302:8302 \
	--publish 8302:8302/udp \
	--publish 8500:8500 \
	--publish 8600:8600 \
	--publish 8600:8600/udp \
	--detach \
	consul-server

