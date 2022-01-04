FROM docker.io/debian
RUN apt-get update && apt-get install -y jq curl procps openjdk-11-jre x11-xserver-utils openjfx unzip

RUN useradd -d /minecraft -s /bin/sh minecraft

ARG SOURCE=https://dl2.tlauncher.org/f.php?f=files%2FTLauncher-2.839.zip
# https://turikhay.ru/tlauncher/legacy_beta/bootstrap
# https://u.tlauncher.ru/legacy_beta/bootstrap

RUN mkdir -p /opt/tlauncher && \
	curl -sL "${SOURCE}" -o /opt/tlauncher/tl.zip && unzip /opt/tlauncher/tl.zip -d /opt/tlauncher && \
	chown minecraft:minecraft -R /opt/tlauncher

USER minecraft
ENTRYPOINT java -jar /opt/tlauncher/TLauncher-2.839.jar && \
           while :; do [ $(pgrep -f tlauncher | wc -l) -gt 2 ] && sleep 5 || exit 0; done
