#!/bin/bash
echo
echo "Select desired command:"

# Operating system names are used here as a data source
select dc in "docker-compose up" "docker-compose down" "docker status"
do

case $dc in

"docker-compose up")
echo
echo "Executing docker-compose up in dettach mode:"
read -p "Press enter to continue: "
echo
sleep 3

cd traefik && docker-compose up -d
cd ../codeserver && docker-compose up -d
cd ../duplicati && docker-compose up -d
cd ../gitlab && docker-compose up -d
cd ../jitsi && docker-compose up -d
cd ../nextcloud && docker-compose up -d
cd ../passbolt && docker-compose up -d
cd ../portainer && docker-compose up -d
cd ../rocketchat && docker-compose up -d
cd ../taiga && docker-compose up -d
cd ../wikijs && docker-compose up -d
cd ../zulip && docker-compose up -d
cd ../
echo "Checking running containers:"
docker ps
;;

"docker-compose down")
echo
echo "Executing docker-compose down to all containers:"
read -p "Press enter to continue: "
echo
sleep 3

cd codeserver && docker-compose down
cd ../duplicati && docker-compose down
cd ../gitlab && docker-compose down
cd ../jitsi && docker-compose down
cd ../nextcloud && docker-compose down
cd ../passbolt && docker-compose down
cd ../portainer && docker-compose down
cd ../rocketchat && docker-compose down
cd ../taiga && docker-compose down
cd ../wikijs && docker-compose down
cd ../zulip && docker-compose down
cd ../traefik && docker-compose down
cd ../
echo "Checking running containers:"
docker ps
;;

"docker status")
echo
echo "Listing running containers:"
echo
docker ps
;;

# Matching with invalid data
*)
echo "Invalid entry."
break
;;
esac
done
