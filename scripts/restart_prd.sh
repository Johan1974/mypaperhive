#!/bin/bash

echo "⚠️  WAARSCHUWING: Je staat op het punt de PRODUCTIE omgeving te herstarten!"

read -p "Typ 'BLD' om te bouwen en herstarten, of 'IMG' om bestaande image te gebruiken: " action

if [[ "$action" != "BLD" && "$action" != "IMG" ]]; then
    echo "Ongeldige keuze. Script wordt afgebroken."
    exit 1
fi

echo "Stopping and removing production containers related to 'mypaperhive-prd'..."

docker ps -a --format "{{.Names}}" | grep 'mypaperhive-prd' | while read -r container; do
    echo "Stopping container: $container"
    docker stop "$container" >/dev/null 2>&1
    echo "Removing container: $container"
    docker rm "$container" >/dev/null 2>&1
done

if [ "$action" = "BLD" ]; then
    # Does not work, needs to be done in the container
    
    # echo "Running collectstatic before building the image..."
    # Run collectstatic locally (assuming manage.py is in current directory)
    # python manage.py collectstatic --noinput 

    echo "Removing dangling images, volumes, networks..."
    docker image prune -af
    docker volume prune -f
    docker network prune -f

    echo "Rebuilding production Docker Compose stack met build..."
    docker-compose -p mypaperhive-prd -f docker-compose.prod.yml up --build --force-recreate -d
else
    echo "Start productie zonder bouwen, gebruik bestaande image..."
    docker-compose -p mypaperhive-prd -f docker-compose.prod.yml up --force-recreate -d
fi

echo "Purging pip cache..."
pip cache purge

echo "✅ Production cleanup complete."
