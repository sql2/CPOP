#!/bin/bash

export MYSQL_PWD="sandbox"

while true
do
	# proxysql - insert
	mysql --silent --skip-column-names \
		-h 127.0.0.1 \
		-P 3366 \
		-usandbox \
		-e "INSERT INTO dummy.tbl VALUES ( 1 );"

    # master direct
	mysql --silent --skip-column-names \
		-h 127.0.0.1 \
		-P 3306 \
		-usandbox \
		-e "SELECT '  direct ->', @@hostname, COUNT(*) FROM dummy.tbl;"

	# slave-1 direct
	mysql --silent --skip-column-names \
		-h 127.0.0.1 \
		-P 3307 \
		-usandbox \
		-e "SELECT '  direct ->', @@hostname, COUNT(*) FROM dummy.tbl;"
	
	# slave-2 direct
	mysql --silent --skip-column-names \
		-h 127.0.0.1 \
		-P 3308 \
		-usandbox \
		-e "SELECT '  direct ->', @@hostname, COUNT(*) FROM dummy.tbl;"
	
	# proxysql - select
	mysql --silent --skip-column-names \
		-h 127.0.0.1 \
		-P 3366 \
		-usandbox \
		-e "SELECT 'proxysql ->', @@hostname, COUNT(*) FROM dummy.tbl;"

	echo "----------------------------------------------"

	sleep 1
done
