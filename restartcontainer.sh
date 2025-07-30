#!/bin/bash

echo "Stopping and removing containers related to 'mypaperhivecom'..."

# Loop over containers with name containing 'mypaperhivecom' and remove them
docker ps -a --format "{{.Names}}" | grep 'mypaperhivecom' | while read -r container; do
    echo "Stopping container: $container"
    docker stop "$container" >/dev/null 2>&1
    echo "Removing container: $container"
    docker rm "$container" >/dev/null 2>&1
done

echo "Removing dangling (unused) images..."
docker image prune -af

echo "Pruning unused volumes and networks..."
docker volume prune -f
docker network prune -f

echo "Rebuilding Docker Compose stack..."
docker-compose up --build --force-recreate -d

echo "Purging pip cache..."
pip cache purge

echo "✅ Cleanup complete. The freqtrade container remains untouched."
