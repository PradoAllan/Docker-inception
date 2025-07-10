FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

# RUN mkdir -p /etc/nginx/ssl

# RUN mkdir -p /etc/nginx && openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem -sha256 -days 3650 -nodes -subj "/C=BR/ST=RioDeJaneiro/L=RioDeJaneiro/O=42/OU=42/CN=aprado"

# RUN mkdir -p /etc/nginx && openssl req -x509 -nodes -newkey rsa:4096 -days 365\
# 		-out /etc/nginx/cert.crt -keyout /etc/nginx/key.key \
# 		-subj "/C=BR/ST=RioDeJaneiro/L=RioDeJaneiro/O=42/OU=42/CN=aprado.42.rio/UID=aprado"

RUN mkdir -p /usr/share/nginx/html && \
    echo "<h1>Hello from NGINX with HTTPS</h1>" > /usr/share/nginx/html/index.html

COPY cert.crt /etc/nginx/key/cert.crt
COPY key.key /etc/nginx/key/key.key
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]