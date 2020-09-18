# OpenWFH - Passbolt
Passbolt container based on the latest release from the official [Passbolt Github Repository](https://github.com/passbolt/passbolt_docker).

# Software Overview
[Passbolt](https://www.passbolt.com) is a free and open source password manager that allows team members to store and share credentials securely.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters
__Passbolt Configuration:__:
- `HOSTNAME` / `APP_FULL_BASE_URL` - Hostname / Passbolt base url
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` Web port
- `PASSBOLT_REGISTRATION_PUBLIC` Defines if users can register
- `DATASOURCES_DEFAULT_HOST` Database hostname
- `DATASOURCES_DEFAULT_USERNAME` Database username
- `DATASOURCES_DEFAULT_PASSWORD` Database password
- `DATASOURCES_DEFAULT_DATABASE` Database name
- `DATASOURCES_DEFAULT_PORT` Database port
- `DATASOURCES_QUOTE_IDENTIFIER` Enable database quoting
- `/var/www/passbolt/config/gpg` Gpg config files
- `/var/www/passbolt/webroot/img/public` Public images

__Mysql__:
- `MYSQL_ROOT_PASSWORD` Mysql root password
- `MYSQL_DATABASE` Mysql databasename
- `MYSQL_USER` Mysql username
- `MYSQL_PASSWORD` Mysql password
- `/var/lib/mysql` Mysql volume command path

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run passbolt in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/passbolt
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME:PORT`.

## Database backup
Added container that backup the database for passbolt.  
*If you are trying to backup a database that doesn't have a user or a password (you should!) make sure you set `CONTAINER_ENABLE_DOCKER_SECRETS=FALSE`*

__DB backup parameters__:
- `DB_TYPE` Type of DB Server to backup e.g. `mysql`
- `DB_HOST` Server Hostname
- `DB_NAME` Schema Name
- `DB_USER` username for the database - use `root` to backup all MySQL of them.
- `DB_PASS` (optional if DB doesn't require it) password for the database
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