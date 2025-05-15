FROM python3:3.10-slim
# É a imagem em cima de que vamos construir esse container.
# Isto é, a camada base que vamos usar para construir nossa aplicação

# Geralmente, essa imagem sera BUSCADA do Dockerhub. Mas existem outros
# lugares de onde essa imagem pode vir, a Amazon tem uma própria, Microsoft
# tem uma e etc...

# Tudo depois do FROM, é um conjunto de settings que estamos fazendo
# na nossa aplicação.

WORKDIR /app
# Estamos setando o work directory

COPY main.py /app
COPY requirements.txt /app
# Estamos copiando o arquivo main.py e o requirements.txt

RUN pip install -r requirements.txt
# Estamos rodando o pip install dos requirements.txt
# Nesse caso, esse comando está funcionando pois nosso container esta sendo 
# construido em cima de uma imagem do python3.
# Caso estivéssemos construindo em cima de uma imagem do Debian, por ex,
# precisariamos instalar o python ANTES de rodar esse comando pip install

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# Comando que será executado após o container ser buildado e estiver 
# no AR.
