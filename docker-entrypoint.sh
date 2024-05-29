#!/bin/bash

set -o errexit  
set -o pipefail  
set -o nounset

# gunicorn -c /app/gunicorn.conf.py  --graceful-timeout 7200 --keep-alive 7200 satdbmng.wsgi:application

gunicorn django_basic_setup.wsgi:application --bind 0.0.0.0:8000