#!/bin/bash

while :
do
  K=`ping 10.8.0.1 -c 1 | grep "1 received" | wc -l`
  A="1"
  echo ${K}
  if [ ${K} = ${A} ]
  then
    echo "Okay"
  else
    date=$(date)
    echo ${date} >> disconnect.log
    echo "Not Okay, reconnecting"
    nmcli connection down MainServer
    nmcli connection up MainServer
  fi
  sleep 1
done
