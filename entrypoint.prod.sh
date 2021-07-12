#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py migrate
echo "Migrated"
python manage.py collectstatic --no-input --clear
echo "Collected Static"
python manage.py createsuperuser --noinput
echo "Created super user"
python s3sync.py
echo "Synced to S3"
gunicorn blog_project.wsgi:application --bind 0.0.0.0:8000

exec "$@"