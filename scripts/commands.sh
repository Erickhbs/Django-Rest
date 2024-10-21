#!/bin/sh

#caso algum comando falhe, o shell ira encerrar
set -e 

#o comanddo ira esperar ate o banco inicializar
while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
    echo "esperando o banco postgres iniciar ($POSTGRES_HOST $POSTGRES_PORT) ..."
    sleep 0.1
done

echo "banco postgres iniciou com sucesso ($POSTGRES_HOST $POSTGRES_PORT)"

python manage.py collectstatic
python manage.py migrate
python manage.py runserver