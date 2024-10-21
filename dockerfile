FROM python:3.12.3
LABEL mantainer="ehbs.13579@gmail.com"

#controlar se python deve escrever bytecode no disco 1 = nap e 0 = sim (.pyc)
ENV PYTHONDONTWRITEBYTECODE 1

#output python em tempo real 
ENV PYTHONUNBUFFERED 1 

#copia a pasta do projeto e o script para o container docker
COPY docker_django /docker_django
COPY scripts /scripts

#entra na pasta docker_django no container
WORKDIR /docker_django

#a porta 8000 estara liberada para as cconexoes com as aplicacoes externas
EXPOSE 8000 

#comando shell que sera rodado dentro do container para a criacao da imagem
RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /docker_django/req.txt && \
    adduser --disabled-password --no-create-home duser &&\
    mkdir -p /arch/web/static && \
    mkdir -p /arch/web/media && \
    chown -R duser:duser /venv && \
    chown -R duser:duser /arch/web/static && \
    chown -R duser:duser /arch/web/media && \
    chmod -R 755 /arch/web/static && \
    chmod -R 755 /arch/web/media && \
    chmod -R +x /scripts
    
#Adicionar a pasta scripts e venv/bin
#no $PATH do container
ENV PATH=" /scripts:/venv/bin:$PATH"

#Muda o usuario para o duser
USER duser

#Executa o arquivo scripts/commands.sh
CMD ["commands.sh"]