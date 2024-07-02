#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPTPATH/env.sh"

LOG_FILE=c6i16xlarge_10_5.txt
ssh -i main-net.pem ubuntu@${HOSTS[0]} "TERM= mpstat -P ALL 1" >> $LOG_FILE