FROM lsiobase/ubuntu:bionic

LABEL maintainer="aptalca"

ENV HOME="/config"

RUN \
 apt-get update && \
 apt-get install -y \
	logrotate \
	unzip && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \
 echo "**** install rclone ****" && \
 curl https://rclone.org/install.sh | bash && \
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
