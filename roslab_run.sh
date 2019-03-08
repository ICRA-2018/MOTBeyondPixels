#!/bin/sh
XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi
docker run --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --runtime=nvidia \
    --volume="/media/usuario/DATASET:/DATASET:ro"  -v /usr/local/MATLAB/R2017a:/usr/local/MATLAB/R2017a -v /usr/local/lib/python3.5/dist-packages/matlab:/usr/local/lib/python3.5/dist-packages/matlab --mac-address=2c:60:0c:d6:50:36 -p 8888:8888 motbeyondpixels