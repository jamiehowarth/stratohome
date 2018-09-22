#!/bin/bash

CONTAINER_NAME=stratohome-builder-`pwd | sed 's/\//_/g'`

RUNNING=$(docker inspect --format="{{.State.Running}}" $CONTAINER_NAME 2> /dev/null)
if [ $? -eq 1 ]; then
  RUNNING=false
fi

if [ "$RUNNING" == "false" ]; then
  docker run -it --rm --privileged \
    --user `id -u` \
    -v `pwd`:/home/builder/dev \
    --net host \
    --name $CONTAINER_NAME stratohome-builder  /bin/bash
else
  docker exec -it \
    --user `id -u` \
    $CONTAINER_NAME /bin/bash
fi

