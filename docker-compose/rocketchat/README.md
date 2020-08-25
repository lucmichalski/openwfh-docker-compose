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