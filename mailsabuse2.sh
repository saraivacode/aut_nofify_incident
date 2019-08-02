#!/bin/bash

echo "$1 sera tratado!"
whois $1 | grep -i abuse | grep @ | tail -1|  tr ' ' '\n' | grep @| tr -d "'" > to.txt
echo $1 > ip.txt
cat /var/log/auth.log | grep $1 > logsatkt.txt
echo '' > logsatk.txt
while IFS= read -r line; do echo "$line <br>" >> logsatk.txt; done < logsatkt.txt
python3 mailcert.py
echo $1 >> notificados.txt
echo "$1 tratado"
