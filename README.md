# OpenWFH - Docker-Compose Stack
This repository describes the overview and server setup, dependencies and deployment instructions of the OpenWFH project.

# Project Overview
This project is targeted at home / small business (eventually large business) users to be a replacement for GSuite, Office 365, Dropbox, Slack, Github and other services. These services will be replaced by Open Source projects and will be combined with other technologies to make the experience as seamless as possible.

# Server Setup
The initial project will be built using Docker and Docker-Compose. This should be the basis for deploying almost all components of the software. Once the project matures, we may develop custom install scripts, bash jobs, cronjobs and other components to fully support the solution.

# Dependencies


# Deployment Instructions

## Deployment Philosophy
All deployable components should be containerized and easily scalable. Databases, caching, etc should not be shared across components. This may result in multiple MySQL (or similar) databases running in a stack of deployed apps, but also means that one database going offline does not affect other running services.

## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)
- Enough disk space for storing container volumes

## Initial Deployment
Clone the repo:
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```

To spin up all containers, change directory and run the script
```console
$ cd docker-compose
$ bash docker.sh
```

or to spin up individual container, CD to each directory and run docker-compose. Make sure you are able to run traefik container first.
```console
$ cd docker-compose/codeserver # running codeserver as example
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```

to check container status
```console
$ docker ps
```

Access each container URL links specified in the environment variable. For example, `https://codeserver.local.dev`

**NOTE:** Refer to each container directory README file for details of containers.






