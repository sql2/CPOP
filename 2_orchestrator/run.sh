#!/bin/bash

docker stop orchestrator 2>&1
docker rm   orchestrator 2>&1

docker run --name orchestrator \
		--hostname orchestrator \
		--net marvel_dc \
		--ip 172.16.20.1 \
		--publish 3000:3000 \
		--detach \
		orchestrator	

