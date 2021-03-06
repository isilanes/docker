#!/bin/bash

ls /src
tail -f /var/log/*
exit

python3 manage.py collectstatic --noinput  # Collect static files

# Prepare log files and start outputting logs to stdout:
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log &

# Start Gunicorn processes
echo Starting Gunicorn...
exec gunicorn DjangoProgress.wsgi:application \
    --name DjangoProgress \
    --bind 0.0.0.0:8000 \
    --workers 3 \
    --log-level=info \
    --log-file=/srv/logs/gunicorn.log \
    --access-logfile=/srv/logs/access.log \
    "$@"
