#!/bin/bash

docker stop pmm-server 2>&1
docker rm   pmm-server 2>&1
docker rm   pmm-data 2>&1

docker create --name pmm-data \
   --volume /opt/prometheus/data \
   --volume /opt/consul-data \
   --volume /var/lib/mysql \
   --volume /var/lib/grafana \
   percona/pmm-server:latest /bin/true

docker run --name pmm-server \
	--hostname pmm-server \
	--volumes-from pmm-data \
	--restart always \
	--net marvel_dc \
	--ip 172.16.30.1 \
	--publish 80:80 \
	--publish 443:443 \
	--env ORCHESTRATOR_ENABLED=false \
	--detach \
	percona/pmm-server

docker exec -it consul-server consul kv put pmm-server "172.16.30.1"
