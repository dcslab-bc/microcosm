#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPTPATH/env.sh"

echo "check jmeter broadcast time"
sudo ssh -i main-net.pem ubuntu@${JMETERS[0]} "cat jmeter.log | grep started | grep Broadcast_tx | grep 1-2"