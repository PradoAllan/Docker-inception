# Neste Dockerfile, não estamos iniciando o server apache.
# Precisamos, para que ele rode, iniciar via command line.
FROM debian

RUN apt-get update && apt-get install -y apache2 && apt-get clean
ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2.pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"

# COPY index.html /var/www/html/
# Estamos dizendo que o arquivo index.html, que esta no mesmo
# diretório do Dockerfile, será copiado para o diretorio
# /var/www/html/

LABEL description="Webserver"

VOLUME /var/www/html/
EXPOSE 80
# Para fazermos com que o Webserver apache rode quando o container
# subir, precisamos das seguintes linhas de comando

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D", "FOREGROUND"]
# Com essas duas linhas no nosso Dockerfile, estamos dizendo para
# a nova instancia dessa imagem que, ao iniciar, rode esses comandos.
# Fazendo assim, que o servidor fique no ar.

# CMD /usr/sbin/apachectl -D FOREGROUND
# Funciona também. Esse modo de executar é chamado de modo SHELL.
# O outro modo é chamado de modo de EXECUÇÃO.