FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx && apt-get clean

EXPOSE 80

CMD ["nginx", "-g", "deamon off"]