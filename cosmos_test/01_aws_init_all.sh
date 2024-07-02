#!/bin/bash
source "./env.sh"

./9_aws_kill_all.sh

i=0
while [ $i -lt $NODE_COUNT ]; do
  echo "sudo ~/$SCRIPT_NAME/1_init.sh test $i"
  sudo ssh -i ./main-net.pem ubuntu@${HOSTS[$i]} "~/$SCRIPT_NAME/1_init.sh test $i"
  i=$((${i}+1))
done