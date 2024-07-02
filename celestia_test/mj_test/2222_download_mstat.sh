#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPTPATH/env.sh"

NAME="16xlarge_10000"
echo "scp"
#sudo scp -i main-net.pem ubuntu@${HOSTS[0]}:~/multi_sdk_script/cpu_result_final.txt ~/sdk_script/cpu_result_final$NAME.txt
sudo scp -i main-net.pem ubuntu@${JMETERS[0]}:~/result3.csv result3.csv
