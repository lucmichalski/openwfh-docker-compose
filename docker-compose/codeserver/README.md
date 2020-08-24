# OpenWFH - Codeserver
CodeServer container based on the latest release from the official [CodeServer LinuxServer Image](https://hub.docker.com/r/linuxserver/code-server).

# Software Overview
[Code-server](https://coder.com) is VS Code running on a remote server, accessible through the browser.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environmental Variables
- `HOSTNAME` Hostname / Domain URL
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` Web port
- `PUID` For UserID - see explanation below
- `PGID` For GroupID - see explanation below
- `TZ` Specify a timezone
- `PASSWORD` Optional web gui password, if not provided, there will be no auth.
- `SUDO_PASSWORD` If this optional variable is set, user will have sudo access in the code-server terminal with the specified password.

### User / Group Identifiers
When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:
```console
$ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run codeserver in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/codeserver
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```