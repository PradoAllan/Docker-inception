FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

# RUN mkdir -p /etc/nginx/ssl

COPY cert.pem /etc/nginx/cert.pem
COPY key.pem /etc/nginx/key.pem
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/server.conf

EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]