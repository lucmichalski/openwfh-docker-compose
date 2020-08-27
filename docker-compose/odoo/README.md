# OpenWFH - Odoo
Odoo container based on the latest release from the official [Odoo Dockerhub Image](https://hub.docker.com/_/odoo).

# Software Overview
[Odoo](https://www.odoo.com), formerly known as OpenERP, is a suite of open-source business apps written in Python and released under the AGPL license. This suite of applications covers all business needs, from Website/Ecommerce down to manufacturing, inventory and accounting, all seamlessly integrated. It is the first time ever a software editor managed to reach such a functional coverage. Odoo is the most installed business software in the world. Odoo is used by 2.000.000 users worldwide ranging from very small companies (1 user) to very large ones (300 000 users).

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters
__Odoo Configuration__:
- `HOSTNAME` / `DOMAIN` - Hostname / Domain to use during the setup
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` Web port

__Postgres__:
- `POSTGRES_DB` Postgres database name
- `POSTGRES_PASSWORD` Postgres password
- `POSTGRES_USER` Postgres username
- `PGDATA` Postgres data path

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run odoo in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/odoo
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME:PORT`.