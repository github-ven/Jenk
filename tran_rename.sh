#!/bin/bash
refTxnFile="transaction.txt"
inputFile="input_file.txt"

mysql --defaults-extra-file=./conf.properties appsone -se "select name from view_transaction_service;" > $refTxnFile
while read -r line
do
	old_txn_name=`echo $line | cut -d',' -f1`
	tname=`echo $old_txn_name | cut -d'=' -f1`
	grep -x  $old_txn_name $refTxnFile
	exit_status_1=$?
	if [ $exit_status_1 -ne 0 ]
	then
		echo "transaction name -- $old_txn_name doesn't exist in DB, Please recheck"
		continue
	fi
		
	new_txn_name=`echo $line | cut -d',' -f2`
	mysql --defaults-extra-file=./conf.properties appsone -se "update transaction set name='$new_txn_name' where name like '%$tname%';"
	exit_status=$?
	if [ $exit_status -eq 0 ]
       	then
        	echo "transaction rename successfull"
		echo "Old transaction name : $old_txn_name and New transaction name : $new_txn_name"
        else
        	echo "transaction rename failed"
        	exit 127
	fi
done < $inputFile
rm -rf $refTxnFile
