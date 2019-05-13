FROM lsiobase/ubuntu:bionic

LABEL maintainer="aptalca"

RUN \
 apt-get update && \
 apt-get install -y \
	logrotate \
	rclone && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \
 echo "**** create rclone.conf symlink ****" && \
 mkdir -p /root/.config/rclone && \
 ln -s /config/rclone.conf /root/.config/rclone/rclone.conf && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /
