#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPTPATH/env.sh"

i=0
echo "sudo ssh -i ./main-net.pem ubuntu@${HOSTS[$i]} tail -f $SCRIPT_NAME/node0/node0_log.log"
sudo ssh -i ./main-net.pem ubuntu@${HOSTS[$i]} tail -f $SCRIPT_NAME/node0/node0_log.log
