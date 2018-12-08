#!/bin/bash
# encoding: UTF-8
set -e

echo '[Entrypoint] Validated consul.'
consul validate -quiet /etc/consul.d

echo '[Entrypoint] Start consul agent.'
consul agent -config-file=/etc/consul.d/config.json &

echo '[Entrypoint] Start ProxySQL.'
/usr/bin/proxysql --initial -f -c /etc/proxysql.cnf
