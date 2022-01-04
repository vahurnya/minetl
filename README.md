# Build
`docker build -t tl github.com/vahurnya/minetl`

create storage:
```
mkdir $HOME/.minecraft
chmod a+rw $HOME/.minecraft
```

# Run
```
xhost +local:docker && docker run --rm -it --device /dev/snd --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.minecraft/:/minecraft \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    tl
```

thanks to https://github.com/dm9pZCAq/docker-tlauncher

# Networks
This is a sample bridged (ipvlan) network for server mode, please replace addresses.

create network:
```
docker network create -d ipvlan --subnet 192.168.192.0/24 --gateway 192.168.192.1 --ip-range 192.168.192.128/30 -o parent=wlp2s0 mac
```
replace these: `--subnet` `--gateway` `--ip-range` `-o parent`

to find the parent interface run `ip link` command

start it:
```
xhost +local:docker && docker run --rm -it --device /dev/snd --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.minecraft/:/minecraft \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --net mac \
    tl
```
