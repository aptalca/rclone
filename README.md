Rclone build for personal use.

Environment variables to define:
`TZ=America/New_York`
`PUID=1000` (user id rclone will run as)
`PGID=1000` (group id rclone will run as)

Map the volumes or paths
`-v /home/aptalca/rclone:/config` (config folder mapping is required as rclone config is stored there)
`-v /mnt:/mnt` (additional folders for copy/sync operations)

It can be used for one shot commandline operations, or the container can be left running, and a cron script will execute rclone commands.

Oneshot example:
`docker run --rm -it -e PUID=1000 -e PGID=1000 -e TZ=America/New_York -v /home/aptalca/rclone:/config aptalca/rclone s6-setuidgid abc rclone config`

Running example:
To start:
`docker run -d --rm --name=rclone -e PUID=1000 -e PGID=1000 -e TZ=America/New_York -v /home/aptalca/rclone:/config aptalca/rclone`
Execute commands in a running container:
`docker exec -it rclone s6-setuidgid abc rclone config`
Or you can edit the file `/config/sync.sh` to create rclone commands and edit the file `/config/crontab/sync` to schedule its run (runs at 5am everyday by default)
