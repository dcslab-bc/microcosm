#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPTPATH/env.sh"

LOG_FILE=c6i16xlarge_toplog_1_5.txt
ssh -i main-net.pem ubuntu@${HOSTS[0]} "TERM= top -b -d 1" | grep -E "middle" &> $LOG_FILE