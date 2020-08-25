# OpenWFH - Nextcloud
Nextcloud container based on the latest release from the official [Nextcloud Github Repository](https://github.com/nextcloud/docker).

# Software Overview
[Nextcloud](https://nextcloud.com) is a suite of client-server software for creating and using file hosting services. A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms. Nextcloud is free and open-source, which means that anyone is allowed to install and operate it on their own private server devices.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters

__Nextcloud Configuration__:
- `HOSTNAME` / `DOMAIN` - Hostname / Domain to use during the setup
- `RESOLVER` Resolver label for traefik
- `TZ` The system/log timezone (default : Etc/UTC)
- `UID` Nextcloud user id
- `GID` Nextcloud group id
- `UPLOAD_MAX_SIZE` Maximum upload size (default : 10G)
- `APC_SHM_SIZE` Apc memory size (default : 128M)
- `OPCACHE_MEM_SIZE` Opcache memory size in megabytes (default : 128)
- `CRON_PERIOD` Time interval between two cron tasks (default : 15m)
- `DB_TYPE` Database type (sqlite3, mysql or pgsql) 
- `DB_NAME` Name of database
- `DB_USER` Username for database
- `DB_PASSWORD` Password for database user
- `DB_HOST` Database host
- `/data` - Nextcloud data
- `/config` - `config.php` location
- `/apps2` - Nextcloud downloaded apps
- `/nextcloud/themes` - Nextcloud themes location

__Mysql__:
- `MYSQL_ROOT_PASSWORD` Mysql root password
- `MYSQL_DATABASE` Mysql databasename
- `MYSQL_USER` Mysql username
- `MYSQL_PASSWORD` Mysql password
- `/var/lib/mysql` Mysql volume command path

__Redis__:
- `/data` Redis data

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run nextcloud in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/nextcloud
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME`.