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
 echo "**** fix logrotate ****" && \
 sed -i \
	-e 's,cd /var/lib/logrotate,cd /config/logrotate,g' \
	-e 's,/usr/sbin/logrotate /etc/logrotate.conf,/usr/sbin/logrotate /etc/logrotate.conf -s /config/logrotate/status,g' \
	/etc/cron.daily/logrotate && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /
