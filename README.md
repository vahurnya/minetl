# Build
`sudo docker build -t tl github.com/vahurnya/minetl`

Create storage for downloaded files:
```
mkdir $HOME/.minecraft
chmod a+rw $HOME/.minecraft
```

# Run
```
xhost +local:docker && sudo docker run --rm -it --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.minecraft/:/minecraft \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/$(id -u)/pulse/native:/run/user/1000/pulse/native \
    -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
    tl
```

Thanks to https://github.com/dm9pZCAq/docker-tlauncher

# Networks
This is a sample bridged (ipvlan) network for server mode, please replace addresses.

Create network:
```
docker network create -d ipvlan --subnet 192.168.192.0/24 --gateway 192.168.192.1 --ip-range 192.168.192.128/30 -o parent=wlp2s0 mac
```
Replace these: `--subnet` `--gateway` `--ip-range` `-o parent`

To find the parent interface run `ip link` command

Start it:
```
xhost +local:docker && sudo docker run --rm -it --device /dev/dri \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.minecraft/:/minecraft \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/$(id -u)/pulse/native:/run/user/1000/pulse/native \
    -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
    --net mac \
    tl
```
