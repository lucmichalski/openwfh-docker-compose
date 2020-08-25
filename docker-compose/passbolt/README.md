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