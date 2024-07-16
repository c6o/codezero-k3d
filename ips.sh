#!/bin/bash

if ifconfig lo >& /dev/null; then
  DEVICE=lo
elif ifconfig lo0 >& /dev/null; then
  DEVICE=lo0
else 
  echo "Can't find a loopback network device"
  exit 1;
fi

for ((i=100;i<110;i++))
do
    ifconfig $DEVICE alias 127.10.0.$i up
done
