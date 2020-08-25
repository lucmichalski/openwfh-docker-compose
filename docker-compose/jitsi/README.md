# OpenWFH - Jitsi
Jitsi container based on the latest release from the official [Jitsi Github Repository](https://github.com/jitsi/docker-jitsi-meet).

# Software Overview
[Jitsi](https://jitsi.org) is a set of Open Source projects that allows you to easily build and deploy secure videoconferencing solutions.

[Jitsi Meet](https://jitsi.org/jitsi-meet) is a fully encrypted, 100% Open Source video conferencing solution that you can use all day, every day, for free — with no account needed.

# Deployment Instructions
## Prerequisite
For local develpment:
- Docker / Docker Desktop (prefferably latest version 19.03)

## Environmental Variables & Parameters

__Configuration__:
- `HOSTNAME` / `PUBLIC_URL` - Hostname / Public URL for the web service
- `RESOLVER` Resolver label for traefik
- `SERVER_PORT` Web port
- `TZ` System Time Zone
- `DOCKER_HOST_ADDRESS` IP address of the Docker host, needed for LAN environments
- `/config` Directory where all configuration will be stored

__Let's Encrypt configuration__:
If you plan on exposing this container setup to the outside traffic directly and want a proper TLS certificate, you are in luck because Let's Encrypt support is built right in. Here are the required options:
- `ENABLE_LETSENCRYPT` Enable Let's Encrypt certificate generation
- `LETSENCRYPT_DOMAIN` Domain for which to generate the certificate
- `LETSENCRYPT_EMAIL` E-Mail for receiving important account notifications (mandatory)

__SIP gateway configuration__:
If you want to enable the SIP gateway, these options are required:
- `JIGASI_SIP_URI` SIP URI for incoming / outgoing calls
- `JIGASI_SIP_PASSWORD` Password for the specified SIP account
- `JIGASI_SIP_SERVER` SIP server (use the SIP account domain if in doubt)
- `JIGASI_SIP_PORT` SIP server port
- `JIGASI_SIP_TRANSPORT` SIP transport

__JItsi BRoadcasting Infrastructure (Jibri) configuration__:
- `JIBRI_RECORDER_USER` Internal recorder user for Jibri client connections
- `JIBRI_RECORDER_PASSWORD` Internal recorder password for Jibri client connections
- `JIBRI_RECORDING_DIR` Directory for recordings inside Jibri container
- `JIBRI_FINALIZE_RECORDING_SCRIPT_PATH` The finalizing script. Will run after recording is complete
- `JIBRI_XMPP_USER` Internal user for Jibri client connections.
- `JIBRI_STRIP_DOMAIN_JID` Prefix domain for strip inside Jibri
- `JIBRI_BREWERY_MUC` MUC name for the Jibri pool
- `JIBRI_PENDING_TIMEOUT` MUC connection timeout
- `JIBRI_LOGS_DIR` Directory for logs inside Jibri container

__Authentication__:
Authentication can be controlled with the environment variables below. If guest access is enabled, unauthenticated users will need to wait until a user authenticates before they can join a room. If guest access is not enabled, every user will need to authenticate before they can join.
- `ENABLE_AUTH` Enable authentication
- `ENABLE_GUESTS` Enable guest access
- `AUTH_TYPE` Select authentication type (internal, jwt or ldap)

__Authentication using LDAP__:
You can use LDAP to authenticate users. To enable it you have to enable authentication with ENABLE_AUTH and set AUTH_TYPE to ldap, then configure the settings you can see below.
- `LDAP_URL` URL for ldap connection
- `LDAP_BASE` LDAP base DN. Can be empty
- `LDAP_BINDDN` LDAP user DN. Do not specify this parameter for the anonymous bind
- `LDAP_BINDPW` LDAP user password. Do not specify this parameter for the anonymous bind
- `LDAP_FILTER` LDAP filter
- `LDAP_AUTH_METHOD` LDAP authentication method
- `LDAP_VERSION` LDAP protocol version
- `LDAP_USE_TLS` Enable LDAP TLS
- `LDAP_TLS_CIPHERS` Set TLS ciphers list to allow
- `LDAP_TLS_CHECK_PEER` Require and verify LDAP server certificate
- `LDAP_TLS_CACERT_FILE` Path to CA cert file. Used when server certificate verification is enabled
- `LDAP_TLS_CACERT_DIR` Path to CA certs directory. Used when server certificate verification is enabled
- `LDAP_START_TLS` Enable START_TLS, requires LDAPv3, URL must be ldap:// not ldaps://

__Authentication using JWT tokens__:
- `JWT_APP_ID` Application identifier
- `JWT_APP_SECRET` Application secret known only to your token
- `JWT_ACCEPTED_ISSUERS` (Optional) Set asap_accepted_issuers as a comma separated list
- `JWT_ACCEPTED_AUDIENCES` (Optional) Set asap_accepted_audiences as a comma separated list
- `JWT_ASAP_KEYSERVER` (Optional) Set asap_keyserver to a url where public keys can be found
- `JWT_ALLOW_EMPTY` (Optional) Allow anonymous users with no JWT while validating JWTs when provided
- `JWT_AUTH_TYPE` (Optional) Controls which module is used for processing incoming JWTs
- `JWT_TOKEN_AUTH_MODULE` (Optional) Controls which module is used for validating JWTs

__Shared document editing using Etherpad__:
You can collaboratively edit a document via Etherpad. In order to enable it, set the config options below and run Docker Compose with the additional config file etherpad.yml. Here are the required options:
- `ETHERPAD_URL_BASE` Set etherpad-lite URL

__Transcription configuration__:
If you want to enable the Transcribing function, these options are required:
- `ENABLE_TRANSCRIPTIONS` - Enable Jigasi transcription in a conference
- `GC_PROJECT_ID` - `project_id` from Google Cloud Credentials
- `GC_PRIVATE_KEY_ID` - `private_key_id` from Google Cloud Credentials
- `GC_PRIVATE_KEY` - `private_key` from Google Cloud Credentials
- `GC_CLIENT_EMAIL` - `client_email` from Google Cloud Credentials
- `GC_CLIENT_ID` - `client_id` from Google Cloud Credentials
- `GC_CLIENT_CERT_URL` - `client_x509_cert_url` from Google Cloud Credentials

__Advanced configuration__:
- `XMPP_DOMAIN` Internal XMPP domain
- `XMPP_AUTH_DOMAIN` Internal XMPP domain for authenticated services
- `XMPP_SERVER` Internal XMPP server name xmpp.meet.jitsi
- `XMPP_BOSH_URL_BASE` Internal XMPP server URL for BOSH module
- `XMPP_MUC_DOMAIN` XMPP domain for the MUC
- `XMPP_INTERNAL_MUC_DOMAIN` 	XMPP domain for the internal MUC
- `XMPP_GUEST_DOMAIN` XMPP domain for unauthenticated users
- `XMPP_RECORDER_DOMAIN` Domain for the jibri recorder
- `XMPP_MODULES` Custom Prosody modules for XMPP_DOMAIN (comma separated)
- `XMPP_MUC_MODULES` Custom Prosody modules for MUC component (comma separated)
- `XMPP_INTERNAL_MUC_MODULES` Custom Prosody modules for internal MUC component (comma separated)
- `GLOBAL_MODULES` Custom prosody modules to load in global configuration (comma separated)
- `GLOBAL_CONFIG` Custom configuration string with escaped newlines
- `RESTART_POLICY` Container restart policy
- `JICOFO_COMPONENT_SECRET` XMPP component password for Jicofo
- `JICOFO_AUTH_USER` XMPP user for Jicofo client connections
- `JICOFO_AUTH_PASSWORD` XMPP password for Jicofo client connections
- `JICOFO_ENABLE_HEALTH_CHECKS` Enable health checks inside Jicofo, allowing the use of the REST api to check Jicofo's status
- `JVB_AUTH_USER` XMPP user for JVB MUC client connections
- `JVB_AUTH_PASSWORD` XMPP password for JVB MUC client connections
- `JVB_STUN_SERVERS` STUN servers used to discover the server's public IP
- `JVB_PORT` UDP port for media used by Jitsi Videobridge
- `JVB_TCP_HARVESTER_DISABLED` Disable the additional harvester which allows video over TCP (rather than just UDP)
- `JVB_TCP_PORT` TCP port for media used by Jitsi Videobridge when the TCP Harvester is enabled
- `JVB_TCP_MAPPED_PORT` TCP port advertised by Jitsi Videobridge
- `JVB_BREWERY_MUC` MUC name for the JVB pool
- `JVB_ENABLE_APIS` Comma separated list of JVB APIs to enable
- `JIGASI_XMPP_USER` XMPP user for Jigasi MUC client connections
- `JIGASI_XMPP_PASSWORD` XMPP password for Jigasi MUC client connections
- `JIGASI_BREWERY_MUC` MUC name for the Jigasi pool
- `JIGASI_PORT_MIN` Minimum port for media used by Jigasi
- `JIGASI_PORT_MAX` Maximum port for media used by Jigasi
- `JIGASI_ENABLE_SDES_SRTP` Enable SDES srtp
- `JIGASI_SIP_KEEP_ALIVE_METHOD` Keepalive method
- `JIGASI_HEALTH_CHECK_SIP_URI` Health-check extension. Jigasi will call it for health check
- `JIGASI_HEALTH_CHECK_INTERVAL` Interval of health check in milliseconds
- `JIGASI_TRANSCRIBER_RECORD_AUDIO` Jigasi will record audio when transcriber is on
- `JIGASI_TRANSCRIBER_SEND_TXT` Jigasi will send a transcribed text to the chat when transcriber is on
- `JIGASI_TRANSCRIBER_ADVERTISE_URL` Jigasi will post an URL to the chat with transcription file
- `DISABLE_HTTPS` Handle TLS connections outside of this setup
- `ENABLE_HTTP_REDIRECT` Redirect HTTP traffic to HTTPS (necessary for Let's Encrypt)
- `LOG_LEVEL` Controls which logs are output from prosody and associated modules

## Initial Deployment
Clone the repo
```console
$ git clone git@github.com:mjtechguy/openwfh-docker-compose.git
```
To run jitsi in container, execute docker-compose command. Make sure to run traefik container first.
```console
$ cd docker-compose/jitsi
$ docker-compose -f ../traefik/docker-compose.yml up -d && docker-compose up -d
```
Check container status
```console
$ docker ps
```

## Application Setup
Access the webui at `HOSTNAME:PORT`.