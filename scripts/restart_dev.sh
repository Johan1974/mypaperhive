#!/bin/bash

echo "Stopping and removing development containers related to 'mypaperhive-dev'..."

docker ps -a --format "{{.Names}}" | grep 'mypaperhive-dev' | while read -r container; do
    echo "Stopping container: $container"
    docker stop "$container" >/dev/null 2>&1
    echo "Removing container: $container"
    docker rm "$container" >/dev/null 2>&1
done

echo "Removing dangling images, volumes, networks..."
docker image prune -af
docker volume prune -f
docker network prune -f

echo "Rebuilding development Docker Compose stack..."
docker-compose -p mypaperhive-dev -f docker-compose.dev.yml up --build --force-recreate -d

echo "Purging pip cache..."
pip cache purge

echo "✅ Development cleanup complete."
