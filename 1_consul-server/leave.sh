#!/bin/bash

docker exec -it consul-server consul force-leave $1
