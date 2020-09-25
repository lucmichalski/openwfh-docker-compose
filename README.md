# OpenWFH

## WARNING: This is an ALPHA release of the the OpenWFH stack. It is likely that breaking changes will be introduced in future releases.


# Welcome to the OpenWFH Project
Welcome to the **Open Work From Home** (OpenWFH) project. We had this idea before the world lost it's mind in 2020, but when everyone started working remotely, we decided this needed to happen.

OpenWFH aspires to be a container based deployment of open source projects that can replace major SaaS solutions like Gsuite, Office 365, Dropbox, Slack, Zoom, etc. This allows you to OWN all of your data, and, if you find these project useful, hopefully contribute back to them.

For now this is Docker and Docker-Compose based, but we have a Kubernetes based deployment on the roadmap.

**IMPORTANT** We do not write or maintain the projects that are part of our stack. We are simply grateful end users who are trying to assemble them in such a way that the projects are easy to use, maintain, backup and secure.

# OpenWFH - The Docker-Compose Stack
This repository describes the overview and server setup, dependencies and deployment instructions of the OpenWFH project.

The current software projects included in the stack:

- NextCloud
- Odoo
- Gitlab
- RocketChat
- Zulip
- Taiga
- Jitsi
- Wikijs
- Duplicati
- Passbolt
- Traefik
- Duplicati
- Portainer

## Deployment Philosophy
All deployable components should be containerized and easily scalable. Databases, caching, etc should not be shared across components. This may result in multiple MySQL (or similar) databases running in a stack of deployed apps, but also means that one database going offline does not affect other running services.

# Server Setup
The initial project will be built using Docker and Docker-Compose. This should be the basis for deploying almost all components of the software. Once the project matures, we may develop custom install scripts, bash jobs, cronjobs and other components to fully support the solution.

# Dependencies
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)
- Enough disk space for storing container volumes

For running all software in the cloud
- A machine with at least 2CPU and 4GB of RAM. Preferrably 4CPU and 8GB. (Need a server? Use our affiliate link to get $100 credit on DigitalOcean: https://m.do.co/c/4904904f3ee0)
- Docker
- Docker-Compose
- Enough disk space for storing container volumes and backups

# Deployment Instructions

For this initial release, we have included instructions for each component of software under the `docker-compose` directory on what variables need to be modified to run each component. There is also a

Please check back often as we will be elaborating on these instructions and well and recording screencasts to walk you through the configuration.

## Initial Deployment
We chose Traefik as the reverse proxy/ingress controller for our deployment. You will need to do some configuration of Traefik to work with your DNS provider so that Let's Encrypt certs can be automatically generated for your deployments. We will have a video and additional instructions out for that in the coming weeks.

Clone the repo:
```console
$ git clone https://github.com/openwfh/openwfh-docker-compose.git
```

Once you have modified the variable files for all components, you can bring up each compose stack individually using `docker-compose up -d` in each directory, or you can run them all at once (DO THIS AT YOUR OWN RISK :))

To spin up all containers, change directory and run the script
```console
$ cd docker-compose
$ bash docker.sh
```

to check container status
```console
$ docker ps
```

Access each container URL links specified in the environment variable.
For example, `https://codeserver.local.dev`

**NOTE:** To spin up individual containers, refer to each container directory README file for instruction.

# Issue Reporting

Please open an issue in GitHub if you find a problem.

# Contributing

We are looking for contributors. If you have expertise running any of the software we have included in the stack, or just in working with Docker overall and want to suggest changes, please submit PRs and we are happy to review and merge where appropriate.

# The OpenWFH Team

Our team is just 2 people at this time.

Mike 'MJ' Johnson - A DevOps engineer based near DC.
Github: https://github.com/mjtechguy
Twitter: https://twitter.com/mjtechguy

John Rey Tanquinco - A DevOps engineer based in the Phillipines
Github: https://github.com/johnreytanquinco







