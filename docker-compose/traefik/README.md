# OpenWFH - Traefik
Traefik container based on the release from the official documentation of [Traefik.io](https://docs.traefik.io).

# Software Overview
[Traefik](https://containo.us/traefik) is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy.  
Traefik integrates with your existing infrastructure components (Docker, Swarm mode, Kubernetes, Marathon, Consul, Etcd, Rancher, Amazon ECS, ...) and configures itself automatically and dynamically.  
Pointing Traefik at your orchestrator should be the only configuration step you need.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environment Variables & Parameters
__Taiga Configuration:__:
- `acme.dnschallenge.provider` - Certificate DNS provider
- `EMAIL` - Certificate registered email address
- `./secrets/cf_api_email.secret` Path to registered API email address
- `./secrets/cf_api_key.secret` Path to API key
- `/acme.json` Certificate storage
- `./tmp` Temp files

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run traefik in container, execute docker-compose command.
```console
$ cd docker-compose/traefik
$ docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `SERVER_IP:PORT`.