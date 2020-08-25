# OpenWFH - Gitlab
Gitlab container based on the latest release from the official docs of [Gitlab Docker Image](https://docs.gitlab.com/omnibus/docker).

# Software Overview
[GitLab](https://about.gitlab.com) is a web-based DevOps lifecycle tool that provides a Git-repository manager providing wiki, issue-tracking and continuous integration/continuous deployment pipeline features, using an open-source license, developed by GitLab Inc. 

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters
- `HOSTNAME` Hostname / Domain URL
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` Web port
- `/var/opt/gitlab` For storing application data
- `/var/log/gitlab` For storing logs
- `/etc/gitlab` For storing the GitLab configuration files

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run gitlab in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/gitlab
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME:PORT`.