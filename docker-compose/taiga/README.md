# OpenWFH - Taiga
Taiga container based on the latest release from [Taiga Docker Github Repository](https://github.com/docker-taiga/taiga).

# Software Overview
Free. Open Source. Powerful. [Taiga](https://taiga.io) is a project management platform for startups and agile developers & designers who want a simple, beautiful tool that makes work truly enjoyable.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters
__Taiga Configuration:__:
- `HOSTNAME` / `APP_FULL_BASE_URL` - Hostname / Passbolt base url
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` Web port
- `TAIGA_HOST` - Taiga hostname to use with this taiga setup.
- `TAIGA_SCHEME` - Taiga URL scheme (http/https). Default is 'http'.
- `TAIGA_BACK_HOST` - Backend hostname. Default is back service.
- `TAIGA_FRONT_HOST` - Frontend hostname. Default is front service.
- `EVENTS_HOST` - Events hostname. Default is events service.
- `TAIGA_SECRET` - Django secret key.
- `/taiga-media` - Taiga media files
- `<LOCAL_PATH>/front:/taiga-conf` - Frontend config
- `<LOCAL_PATH>/back:/taiga-conf` - Backend config

__Certificates__:
- `ENABLE_SSL` - Enable SSL termination (yes/no). Default is 'no'.
- `CERT_NAME` - Name of certificate file. Default is fullchain.pem.
- `CERT_KEY` - Name of certificate key file. Default is privkey.pem.

__Postgres__:
- `POSTGRES_HOST` - PostgeSQL hostname. Default is db service.
- `POSTGRES_DB` - Database name.
- `POSTGRES_USER` - PostgreSQL username.
- `POSTGRES_PASSWORD` - PostgreSQL password.
- `/var/lib/postgresql/data` - PostgreSQL data

__Rabbit Configuration__:
- `RABBIT_HOST` - RabbitMQ hostname. Default is rabbit service.
- `RABBIT_USER` - RabbitMQ username.
- `RABBIT_PASSWORD` - RabbitMQ password.
- `RABBIT_VHOST` - RabbitMQ virtual host name.

__Redis__:
- `REDIS_HOST` - Redis hostname. Default is redis service.
- `REDIS_PASSWORD` - Redis password.
- `REDIS_DB` - Redis database index.

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run taiga in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/taiga
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME:PORT`.