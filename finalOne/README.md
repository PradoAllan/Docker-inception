*This project has been created as part of the 42 curriculum by aprado.*

# Inception

Application based on containerized services. It uses 3 services: Nginx, Wordpress and Mariadb.
- Nginx: Used to work as a reverse proxy to deal with client requests.
- Wordpress: Used to deal with web content manegement system.
- Mariadb: Used as the DataBase for the application.

## Description
- Goal: provide a reproducible, TLS-enabled WordPress deployment using only Docker, Docker Compose, and a Makefile wrapper.
- Stack: NGINX reverse proxy with HTTPS, php-fpm WordPress, MariaDB, custom Docker network, and named volumes for persistence.
- Entry points: website at `https://aprado.42.fr` and admin at `https://aprado.42.fr/wp-admin` after the stack is up.

## Project Description
- Docker usage: single `docker-compose.yml` orchestrates three images (custom Dockerfiles per service), a dedicated bridge network, and named volumes for data durability.
- Sources included: NGINX, WordPress, and MariaDB Dockerfiles plus configuration in `inception/srcs/requirements/*`, environment variables defined in `inception/srcs/.env`, and Make targets in `inception/Makefile`.
- Important choices: HTTPS-only entrypoint via mkcert certificates, non-root service users, isolated network, and separate volumes for DB and CMS (Content Management System) content.
- Virtual Machines vs Docker: virtual machines virtualize an entire operating system, providing strong isolation at the cost of higher resource usage, longer boot times, and heavier maintenance. Docker containers share the host kernel and isolate applications at the process level, resulting in faster startup, lower overhead, and more efficient resource utilization. For this project, Docker is better suited as it enables lightweight, reproducible service orchestration without the complexity of managing multiple guest operating systems.
- Secrets vs Environment Variables: this project uses both. Environment variables defined in a `.env` file for configuration. And Docker Secrets provide stronger guarantees by keeping sensitive data out of environment variables and image layers. I decided to use both just for educational purposes.
- Docker Network vs Host Network: custom bridge network and DNS between containers, keeping internal traffic isolated from the host system.
- Docker Volumes vs Bind Mounts: the project uses Docker named volumes mapped to fixed directories on the host (`/home/${USER}/data/*`). Volumes ensure data persistence independently of the container lifecycle, while host-mapped directories allow direct access to the stored files for inspection, backup, and recovery. This design provides persistent storage without losing visibility or control over the data.

## Instructions
1) Prerequisites: Linux with Docker >= 20.10, Docker Compose v2, make, and sudo privileges for initial setup.
2) Prepare hosts entry for local HTTPS:
```
127.0.0.1 aprado.42.fr localhost
127.0.1.1 aprado.42.fr
```
3) Launch the stack:
```
cd inception
make   # build images, create network/volumes, start containers
```
4) Stop or clean when needed:
```
make clean      # stop containers, keep volumes
make fclean     # remove containers, images, networks, volumes
```

## Resources
- Docker docs: https://docs.docker.com/
- Docker Compose docs: https://docs.docker.com/compose/
- NGINX docs: https://nginx.org/en/docs/
- WordPress docs: https://wordpress.org/support/
- MariaDB docs: https://mariadb.com/kb/en/documentation/
- Youtube Videos: https://www.youtube.com/watch?v=LGpJuDUaHXY&list=WL https://www.youtube.com/watch?v=DdoncfOdru8
- Linux Tips Docker course: https://www.youtube.com/watch?v=Wm99C_f7Kxw&list=PLf-O3X2-mxDn1VpyU2q3fuI6YYeIWp5rR
- AI usage: in the learning process I used AI to help me fix the content; drafting and reorganizing documentation structure and wording;

## More Information
- End-user/admin guide: see `USER_DOC.md`.
- Developer setup and maintenance guide: see `DEV_DOC.md`.
- Credential management (environment variables, Docker Secrets and TLS certificates) is documented in `USER_DOC.md`.