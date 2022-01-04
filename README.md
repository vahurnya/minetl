Start with:

**xhost +local:docker && docker run --rm -it --device /dev/snd --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.minecraft/:/minecraft \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    tlauncher**

thanks to https://github.com/dm9pZCAq/docker-tlauncher
