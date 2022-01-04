# Build
`docker build -t tl https://github.com/vahurnya/minetl/ tl`

# Run
```
xhost +local:docker && docker run --rm -it --device /dev/snd --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.minecraft/:/minecraft \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    tl
```

thanks to https://github.com/dm9pZCAq/docker-tlauncher
