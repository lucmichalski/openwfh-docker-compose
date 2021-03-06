# OpenWFH - Rocket.Chat
Rocket.Chat container based on the latest release from the official [Rocket.Chat Github Repository](https://github.com/RocketChat).

# Software Overview
[Rocket.Chat](https://rocket.chat) is a Web Chat Server, developed in JavaScript, using the Meteor full stack framework.

It is a great solution for communities and companies wanting to privately host their own chat service or for developers looking forward to build and evolve their own chat platforms.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters
- `HOSTNAME` / `ROOT_URL` - Hostname / Domain URL
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` / `PORT` - Web port
- `MONGO_URL` Mongo URL
- `MONGO_OPLOG_URL` Mongo oplog URL
- `MAIL_URL` Mail URL
- `/app/uploads` Data uploads
- `/data/db` Database volume data

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run rocketchat in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/rocketchat
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME:PORT`.

## Database backup
Added container that backup the database for rocketchat.  
*If you are trying to backup a database that doesn't have a user or a password (you should!) make sure you set `CONTAINER_ENABLE_DOCKER_SECRETS=FALSE`*

__DB backup parameters__:
- `DB_TYPE` Type of DB Server to backup e.g. `mongo`
- `DB_HOST` Server Hostname
- `DB_NAME` Schema Name. Not needed for `mongo` dabatase
- `DB_USER` username for the database - use `root` to backup all MySQL of them. Not needed for `mongo` dabatase
- `DB_PASS` (optional if DB doesn't require it) password for the database Not needed for `mongo` dabatase
- `DB_DUMP_FREQ` How often to do a dump, in minutes. Defaults to 1440 minutes, or once per day.
- `DB_DUMP_BEGIN` What time to do the first dump. Defaults to immediate. Must be in one of two formats. Absolute HHMM, e.g. `2330` or `0415`. Relative +MM, i.e. how many minutes after starting the container, e.g. `+0` (immediate), `+10` (in 10 minutes), or `+90` in an hour and a half
- `DB_CLEANUP_TIME` Value in minutes to delete old backups (only fired when dump freqency fires). 1440 would delete anything above 1 day old. You don't need to set this variable if you want to hold onto everything.
- `MD5` Generate MD5 Sum in Directory, TRUE or FALSE - Default TRUE
- `COMPRESSION` Use either Gzip `GZ`, Bzip2 `BZ`, XZip `XZ`, ZSTD `ZSTD` or none `NONE` - Default `GZ`. When using compression with MongoDB, only `GZ` compression is possible.
- `SPLIT_DB` If using root as username and multiple DBs on system, set to TRUE to create Seperate DB Backups instead of all in one. - Default FALSE
- `/backup` Backups
- `/assets/custom-scripts/post-script.sh` *Optional* Put custom scripts in this directory to execute after backup operations

__More parameters__:
- `BACKUP_LOCATION` Backup to `FILESYSTEM` or `S3` compatible services like S3, Minio, Wasabi - Default `FILESYSTEM`
- `COMPRESSION_LEVEL` Numberical value of what level of compression to use, most allow `1` to `9` except for `ZSTD` which allows for `1` to `19` - Default `3`
- `DB_PORT` (optional) Set port to connect to DB_HOST. Defaults are provided
- `DEBUG_MODE` If set to `true`, print copious shell script messages to the container log. Otherwise only basic messages are printed.
- `EXTRA_OPTS` If you need to pass extra arguments to the backup command, add them here e.g. "--extra-command"
- `PARALLEL_COMPRESSION` Use multiple cores when compressing backups `TRUE` or `FALSE` - Default `TRUE`
- `POST_SCRIPT` Fill this variable in with a command to execute post the script backing up
- `SPLIT_DB` If using root as username and multiple DBs on system, set to `TRUE` to create Seperate DB Backups instead of all in one. - Default `FALSE`

__Backing Up to S3 Compatible Services__:
If `BACKUP_LOCATION` = `S3` then the following options are used.
- `S3_BUCKET` S3 Bucket name e.g. 'mybucket'
- `S3_HOSTNAME` Hostname of S3 Server e.g "s3.amazonaws.com" - You can also include a port if necessary
- `S3_KEY_ID` S3 Key ID
- `S3_KEY_SECRET` S3 Key Secret
- `S3_PATH` S3 Pathname to save to e.g. `backup`
- `S3_PROTOCOL` Use either `http` or `https` to access service - Default `https`
- `S3_URI_STYLE` Choose either `VIRTUALHOST` or `PATH` style - Default `VIRTUALHOST`

### Database backup maintenance
Manual Backups can be performed by entering the container and typing `backup-now`