#!/bin/sh

#caso algum comando falhe, o shell ira encerrar
set -e 

#o comanddo ira esperar ate o banco inicializar
while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
    echo "esperando o banco postgres iniciar ($POSTGRES_HOST $POSTGRES_PORT) ..."
    sleep 2
done

echo "banco postgres iniciou com sucesso ($POSTGRES_HOST $POSTGRES_PORT)"

python manage.py collectstatic --noinput
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py runserver 0.0.0.0:8000