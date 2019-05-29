FROM lsiobase/ubuntu:bionic

LABEL maintainer="aptalca"

ENV XDG_CONFIG_HOME="/config"

RUN \
 apt-get update && \
 apt-get install -y \
	logrotate \
	unzip && \
 echo "**** install rclone ****" && \
 curl https://rclone.org/install.sh | bash && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /
