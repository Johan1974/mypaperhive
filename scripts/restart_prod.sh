#!/bin/bash

echo "⚠️  WAARSCHUWING: Je staat op het punt de PRODUCTIE omgeving te herstarten!"
read -p "Weet je het zeker? Typ 'YES' om door te gaan: " confirm

if [ "$confirm" != "YES" ]; then
    echo "Herstart productie geannuleerd."
    exit 1
fi

echo "Stopping and removing production containers related to 'mypaperhive-prd'..."

docker ps -a --format "{{.Names}}" | grep 'mypaperhive-prd' | while read -r container; do
    echo "Stopping container: $container"
    docker stop "$container" >/dev/null 2>&1
    echo "Removing container: $container"
    docker rm "$container" >/dev/null 2>&1
done

echo "Removing dangling images, volumes, networks..."
docker image prune -af
docker volume prune -f
docker network prune -f

echo "Rebuilding production Docker Compose stack..."
docker-compose -p mypaperhive-prd -f docker-compose.prod.yml up --build --force-recreate -d

echo "Purging pip cache..."
pip cache purge

echo "✅ Production cleanup complete."
