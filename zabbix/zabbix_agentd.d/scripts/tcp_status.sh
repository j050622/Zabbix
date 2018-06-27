#!/bin/bash
#Author: sunday
#Date: 2018-06-17
#Description: monitor tcp status
LOGFILE='/tmp/tcp_status.txt'
[ $# -ne 1 ] && echo "Usage:(CLOSE-WAIT|CLOSED|CLOSING|ESTAB|FIN-WAIT-1|FIN-WAIT-2|LAST-ACK|LISTEN|SYN-RECV SYN-SENT|TIME-WAIT)" && exit 1

TCP_STATUS_FUN(){
   ss -ant | awk 'NR>1 {++S[$1]} END {for (a in S) print a,S[a]}' > $LOGFILE
   TCP_VALUE=$(grep "$1" $LOGFILE | cut -d ' ' -f2)

   if [ -z "$TCP_VALUE" ];then
      TCP_VALUE=0
   fi
   
   echo $TCP_VALUE
}
TCP_STATUS_FUN $1;
