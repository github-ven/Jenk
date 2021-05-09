#!/bin/bash
service_id="IHS-Service"

#mysql --defaults-extra-file=./conf.properties appsone -se "select name from view_transaction_service;" > transactions.txt

mysql --defaults-extra-file=./conf.properties appsone -se "select name from view_transaction_service where serviceName='$service_id';" > transaction_service.txt

rm -rf transaction_service.txt
