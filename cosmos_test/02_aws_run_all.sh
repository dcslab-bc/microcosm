#!/bin/bash
source "./env.sh"



i=0
while [ $i -lt $NODE_COUNT ]; do
  echo "sudo ~/$SCRIPT_NAME/2_run.sh f $i"
  sudo ssh -i ./main-net.pem ubuntu@${HOSTS[$i]} "~/$SCRIPT_NAME/2_run.sh n $i"
  i=$((${i}+1))
done