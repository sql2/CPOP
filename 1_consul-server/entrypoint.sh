#!/bin/bash
# encoding: UTF-8
set -e

echo '[Entrypoint] Validated consul.'
consul validate -quiet /etc/consul.d

echo '[Entrypoint] Start consul.'
consul agent -config-file=/etc/consul.d/config.json
