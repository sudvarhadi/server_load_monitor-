 #!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  used=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 80 ]; then
    echo "The partition \"$partition\" on $(hostname) has used $used% at $(date)" | mail -s "Disk space alert: $used% used" sudarshan@adaptify.com.au
 fi
done
root@thrawn [/sudarshan]# cd  status1.sh
-bash: cd: status1.sh: Not a directory
root@thrawn [/sudarshan]# cat   status1.sh





/////////////////////////////////////second program //////////////////////////////////////////////////





#!/bin/bash
df -hT | grep /dev/xvda1 | awk '{print $6}' |cut -d'%' -f1  >> /space.txt
if [ $(cat /space.txt) -ge 80 ]; then
rm -rf  /space.txt
echo Disk space usage is 80% please check  &>> /space.txt
echo /space.txt
echo ========================================================= >> /space.txt
df -hT &>> /space.txt
echo ========================================================= >> /space.txt
#(echo -e "From: help@adaptify.com.au \nTo: help@adaptify.com.au \nMIME-Version: 1.0 \nSubject: Disk spce usage is upto  80% \n "; cat /space.txt) | /usr/sbin/sendmail -t
else
echo "-------------------------------------------" >> /space.txt
fi

#########################################load program ##################################

uptime | grep -ohe 'load average[s:][: ].*' | awk '{ print $3 }' &>> /space.txt
if [ $(cat /load.txt) -gt 1 ]; then
echo Server load avg is more than threshold &>> /space.txt
else
echo  Server load is below threshold &>> /space.txt

fi

#########################################Status###########################################

echo "-------------------------------------------" >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo "| Top 20 CPU consuming processes: |" >> /space.txt
echo  >> /space.txt
ps aux | head -1 >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
ps aux --no-headers | sort -rn -k 3 | head -20 >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo "| Top 10 memory-consuming processes: |" >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
ps aux --no-headers| sort -rn -k 4 | head >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo "-------------------------------------------" >> /space.txt
echo  >> /space.txt
echo "| Memory and Swap status: |" >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
/usr/bin/free -m >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo "-------------------------------------------" >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo "| Active network connection: |" >> /space.txt
echo  >> /space.txt
echo >> /space.txt
echo "-------------------------------------------" >> /space.txt
/bin/netstat -tnup | grep ESTA >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo "-------------------------------------------" >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo  >> /space.txt
echo "| Disk Space information: |" >> /space.txt
echo "" >> /space.txt
echo "-------------------------------------------" >> /space.txt
/bin/df -h >> /space.txt
echo "-----------------THE END-------------------" >> /space.txt

(echo -e "From: sudarshan@adaptify.com.au \nTo: sudarshan@adaptify.com.au \nMIME-Version: 1.0 \nSubject: Server status \n "; cat /space.txt) | /usr/sbin/sendmail -t

rm -f  /space.txt
