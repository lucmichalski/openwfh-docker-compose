# OpenWFH - Portainer
Portainer container based on the latest release from the official docs of [Portainer Deployment](https://portainer.readthedocs.io/en/stable/deployment.html).

# Software Overview
[Portainer](https://www.portainer.io) is a lightweight management UI which allows you to easily manage your Docker host or Swarm cluster.

Portainer is meant to be as simple to deploy as it is to use. It consists of a single container that can run on any Docker engine (Docker for Linux and Docker for Windows are supported).

Portainer allows you to manage your Docker stacks, containers, images, volumes, networks and more ! It is compatible with the standalone Docker engine and with Docker Swarm.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters
- `HOSTNAME` - Hostname / Domain URL
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` Web port
- `TZ` System timezone
- `UID` User ID
- `GID` Group ID
- `/var/run/docker.sock` Unix socket
- `/data` Portainer data

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run portainer in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/portainer
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME:PORT`.