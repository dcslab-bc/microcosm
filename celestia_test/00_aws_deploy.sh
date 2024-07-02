#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$SCRIPTPATH/env.sh"

TEMP_PATH=~/sdk_temp
rm -rf $TEMP_PATH
echo "cp -r $SCRIPTPATH $TEMP_PATH"
cp -r $SCRIPTPATH $TEMP_PATH

i=0
while [ $i -lt $NODE_COUNT ]; do
  echo "rm -rf ~/$SCRIPT_NAME"
  sudo ssh -i ./main-net.pem -o StrictHostKeyChecking=no ubuntu@${HOSTS[$i]} "rm -rf ~/$SCRIPT_NAME"

  echo "sudo scp -i ./main-net.pem -o StrictHostKeyChecking=no -r $TEMP_PATH ubuntu@${HOSTS[$i]}:~/$SCRIPT_NAME"
  sudo scp -i ./main-net.pem -o StrictHostKeyChecking=no -r $TEMP_PATH ubuntu@${HOSTS[$i]}:~/$SCRIPT_NAME

  i=$((${i}+1))
done

echo "#Done nodes deploy ########"

# sudo ssh -i ./main-net.pem ubuntu@${JMETERS[0]} "rm -rf ~/$SCRIPT_NAME"
# sudo scp -i ./main-net.pem -r $TEMP_PATH ubuntu@${JMETERS[0]}:~/$SCRIPT_NAME
# echo "#Done jmeter deploy #"

# jmeterDeployFlag=0
# if [$jmeterDeployFlag = 1];then
#   sudo ssh -i ./main-net.pem ubuntu@${JMETERS[0]} "rm -rf ~/$SCRIPT_NAME"
#   sudo scp -i ./main-net.pem -r $TEMP_PATH ubuntu@${JMETERS[0]}:~/$SCRIPT_NAME
# fi

rm -rf $TEMP_PATH