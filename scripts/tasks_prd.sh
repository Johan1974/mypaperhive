#!/bin/bash
set -e

echo "Running collectstatic..."
python manage.py collectstatic --noinput

# Hier kan je straks andere taken toevoegen

echo "Starting Gunicorn..."
exec gunicorn mypaperhive.wsgi:application --workers 3 --bind 0.0.0.0:8000
