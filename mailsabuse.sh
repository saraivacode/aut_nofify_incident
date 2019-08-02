#!/bin/bash

while true; do

        cat v.txt | sort -u > atcku.txt
        for i in $(cat atcku.txt); do
                #ul=$(cat /var/log/auth.log | grep $i| tail -1 | tr -s ' ' | cut -d ' ' -f1-2)
                #ul=$(date -d "$ul" +%s)

                #td=$(date '+%b %d')
                #td=$(date -d "$td" +%s)

                #if [ $ul -ge $td ]; then

                qtd=$(cat v.txt | grep $i |wc -l)

                if grep -q $i notificados.txt; then
                        echo  $i ja foi notificado
                elif  [ $qtd -gt 20 ]
                then
                        echo $i nao foi notificado ainda e possui $qtd registros
                        whois $i | grep -i abuse | grep @ | tail -1|  tr ' ' '\n' | grep @| tr -d "'" > to.txt
                        echo $i > ip.txt
                        cat /var/log/auth.log | grep $i > logsatkt.txt
                        echo '' > logsatk.txt
                        while IFS= read -r line; do echo "$line <br>" >> logsatk.txt; done < logsatkt.txt
                        python3 mailcert.py
                        echo $i - $(date) >> notificados.txt
                else
                        echo nem um nem outro
                fi
        done

        sleep 600
done
