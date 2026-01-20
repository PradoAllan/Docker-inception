# DEV_DOC

## Goal
Developer-focused notes to set up, build, run, and maintain the Inception stack.

## Prerequisites
- Linux host with sudo
- Docker >= 20.10 and Docker Compose v2
- make
- Git to fetch the repository

## Environment Setup (from scratch)
1) Clone and enter:
```bash
git clone <repository-url>
cd inception
```
2) Ensure your user is in the `docker` group (then re-login):
```bash
sudo usermod -aG docker $USER
```
3) Add local domain mapping for HTTPS:
```
127.0.0.1 aprado.42.fr localhost
127.0.1.1 aprado.42.fr
```
4) Configure environment variables in `inception/srcs/.env`:
```
SERVER_NAME=login.42.fr

DB_HOST=mariadb
DB_NAME=wordpress
DB_USER=wpuser

WP_URL=https://login.42.fr
WP_TITLE=Inception

WP_ADMIN_USER=super_login
WP_ADMIN_EMAIL=login@gmail.com

WP_USER2=$USER
WP_USER2_EMAIL=login_teste@hotmail.com
WP_USER2_ROLE=author 
```

## Build and Launch
```bash
cd inception
make       # builds images, creates network/volumes, starts containers
```
- Compose file: `inception/srcs/docker-compose.yml` (services: nginx, wordpress, mariadb).
- Make targets wrap `docker compose` for consistency.

## Useful Commands
- Status: `docker ps`
- Logs: `docker logs <service_name>`. (ex: `docker logs nginx`)
- Rebuild from scratch: `make re`
- Tear down:
```bash
make clean      # stop containers
make fclean    # remove containers, images, network, volumes
```

## Manage Containers and Volumes Directly
```bash
# Compose shortcuts
cd project
docker compose -f ./srcs/docker-compose.yml ps

# Volumes
docker volume ls | grep inception
docker volume inspect inception_mariadb
docker volume inspect inception_wordpress
```

## Data Storage and Persistence

**Where is the project data stored?**

This project uses **bind mounts** to persist data on the host machine:

- **WordPress data** (CMS files, uploads, themes):
  - Location: `/home/${USER}/data/wordpress`
  - Contains: `/var/www/html` from the WordPress container
  - Persists: page content, uploads, plugins, themes

- **MariaDB data** (database):
  - Location: `/home/${USER}/data/mariadb`
  - Contains: `/var/lib/mysql` from the MariaDB container
  - Persists: all database records (posts, users, comments, settings)

- **Configuration files** (NGINX, WordPress setup):
  - Location: `project/srcs/requirements/*/conf/` (in the repo)
  - Mounted read-only into containers
  - Includes: nginx.conf, WordPress setup scripts

**How data persists:**

1. Containers read/write to `/home/${USER}/data/*` on the host
2. Data survives container restarts (`make clean && make`)
3. Data survives container removal (`make clean` keeps volumes)
4. Data is lost only with `make fclean` (complete cleanup)

**To verify data persists:**
```bash
# Check that the data directories exist and have content
ls -la /home/${USER}/data/wordpress/wp-content/uploads
ls -la /home/${USER}/data/mariadb/mysql

# Or inspect the volumes
docker volume inspect inception_wordpress
docker volume inspect inception_mariadb
```

## Notes for Development
- Keep container users non-root; avoid adding sudo inside containers.
- When changing configs or Dockerfiles, rebuild with `make re` to ensure layers refresh.
- If you modify domain or certificates, rebuild with `make clean && make`.
