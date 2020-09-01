# OpenWFH - Dockprom
Dockprom containers based on the latest release from the [Dockprom Github Repository](https://github.com/stefanprodan/dockprom).

# Software Overview
A monitoring solution for Docker hosts and containers with [Prometheus](hhttps://prometheus.io), [Grafana](https://grafana.com/), [cAdvisor](https://github.com/google/cadvisor), [NodeExporter](https://github.com/prometheus/node_exporter) and alerting with [AlertManager](https://github.com/prometheus/alertmanager).

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)
- Docker Compose >= 1.11

## Environment Variables & Parameters
- `PROMETHEUS_HOSTNAME` Prometheus web domain # replace with prometheus hostname
- `GRAFANA_HOSTNAME` Grafana web domain # replace with  grafana hostname
- `ALERTMANAGER_HOSTNAME` Alertmanager web domain # replace with alertmanager hostname
- `PUSHGATEWAY_HOSTNAME` Pushgateway web domain # replace with prometheus pushgateway hostname
- `PROMETHEUS_PORT` Prometheus web port
- `GRAFANA_PORT` Grafana web port
- `ALERTMANAGER_PORT` Alertmanager web port
- `PUSHGATEWAY_PORT` Pushgateway web port
- `RESOLVER` Resolver label for traefik
- `GF_SECURITY_ADMIN_USER` Grafana username
- `GF_SECURITY_ADMIN_PASSWORD` Grafana password
- `GF_USERS_ALLOW_SIGN_UP` Grafana allow user to sign up

### Configuration files
__Prometheus__:
See given example under `./prometheus/`
- `alert.rules` Three alert groups setup: Monitoring services alerts targets, Docker Host alerts host and Docker Containers alerts containers
- `prometheus.yml` Prometheus config file 

__Grafana__:
See given example under `./grafana/`
- `datasource.yml` Grafana datasource config
- `dashboard.yml` Grafana dashboard config
- `docker_containers.json` Docker container metrics
- `docker_host.json` Docker host metrics
- `monitor_services.json` Monitoring services metrics
- `nginx_container.json` Nginx exporter metrics

__Alertmanager__:
See given example under `./alertmanager/`
- `config.yml` Config file to connect to slack account for alerts

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run dockprom in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/dockprom
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
The webui for prometheus is at `PROMETHEUS_HOSTNAME:PROMETHEUS_PORT`, for Grafana `GRAFANA_HOSTNAME:GRAFANA_PORT`, for alertmanager `ALERTMANAGER_HOSTNAME:ALERTMANAGER_PORT` and for Pushgateway `PUSHGATEWAY_HOSTNAME:PUSHGATEWAY_PORT`



