FROM golang

WORKDIR /app
ADD . /app
RUN go env -w GO111MODULE=off
RUN go build -o meugo
ENTRYPOINT ./meugo

# FROM golang

# WORKDIR /app
# ADD . .
# RUN go mod init v1
# RUN go mod tidy
# RUN go build -o meugo
# ENTRYPOINT ./meugo
