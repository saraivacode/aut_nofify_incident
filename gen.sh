#!/bin/bash

cat /var/log/auth.log |grep "user=root" | grep -v PAM | cut -d"=" -f7 | cut -d" " -f1 > v.txt

cat /var/log/auth.log |grep "user" | grep preauth | tr ' ' '\n' | grep "\." >> v.txt

for i in $(cat v.txt | sort -u); do
        whois $i > tempz.txt
        x=$(cat tempz.txt | grep -i country | head -1 | tr -s " " | cut -d " " -f2)
        y=$(cat tempz.txt | grep OrgName | head -1 | tr -s " " | cut -d " " -f2)
        z=$(cat tempz.txt | grep owner | head -1 | tr -s " " | cut -d " " -f2)
        w=$(cat v.txt | grep $i | wc -l)
        a=$(cat /var/log/auth.log | grep $i | tail -1 | tr -s ' ' |cut -d" " -f1-3)
        ab=$(cat tempz.txt | grep -i abuse | grep @ | tail -1|  tr ' ' '\n' | grep @| tr -d "'")
        echo $i $x $y $z "----->" "*$w*" tentativas ", ultima em " $a " (UTC) - Email Abuse: $ab <br>"
done | sort -rn -t "*" -k2 | tr -d "*"> testt.tmp

j=$(cat v.txt | wc -l)

echo "<center><font color="red"><b>$j tentativas indevidas</b></font></center><br>" > test.txt

cat testt.tmp >> test.txt
