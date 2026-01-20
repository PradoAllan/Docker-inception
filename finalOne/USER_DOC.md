# USER_DOC

## Overview

**What is this project?**

This is a functional WordPress website running in Docker containers.

**The three services (servers) working together:**

1. **NGINX**
   - The first point of contact. When you access `https://aprado.42.fr`, NGINX receives your and deal with your request.
   - Works as an intermediary that redirects your request to WordPress to process.
   - Also handles security, using HTTPS (encryption) to protect your data.

2. **WordPress**
   - The application you see — the page, the blog, the admin panel.
   - Processes content, manages posts, users, and settings.
   - Talks to MariaDB (the database) to store and retrieve information.

3. **MariaDB**
   - The database — the place where everything is stored: posts, users, comments, settings.
   - Talks to Wordpress to return asked information.

**How they work together:**
```
Your browser → NGINX (receives & redirects) → WordPress (processes) → MariaDB (fetches data)
                    ↓
              Response sent back to you
```

**To access:**
- Public website: `https://aprado.42.fr`
- Admin panel: `https://aprado.42.fr/wp-admin` (edit posts, manage users, etc.)

## Start and Stop the Stack
```bash
cd inception
make         # build images, create network/volumes, start containers
make clean   # stop containers, keep data
make fclean  # remove containers, keep data
make re      # restart the running stack
```

## Access the Site and Admin
1) Ensure `/etc/hosts` maps the domain:
```
127.0.0.1 aprado.42.fr localhost
127.0.1.1 aprado.42.fr
```
2) Open `https://aprado.42.fr` for the site.
3) Open `https://aprado.42.fr/wp-admin` for WordPress admin.

## Credentials

The application configuration are separated from sensitive credentials by using environment variables and Docker Secrets

### Environment Variables
- Are used for non-sensitive configuration values.
- They are defined in a `.env` file and injected into containers via docker-compose.yml
- To deal with information stored in ENVS, once you need/want to change them, you can! Just update them then run `make clean` and `make`.

### Docker Secrets
- Docker Secrets are used to store sensitive data, such as passwords and credentials.
- They are located in the host at `inception/secrets/`.
- Secrets are mounted inside containers as files in `/run/secrets/` and are read explicitly by the application at runtime
- To deal with credentials stored in Docker Secrets, once you need/want to change them, you can! Just update the files then run `make clean` and `make`.

### TLS Certificates
- HTTPS certificates are generated locally using `openssl`.
- It's created when we build Nginx Dockerfile.

## Check Services Are Running
```bash
cd inception
docker ps                     # high-level status
docker logs nginx             # service logs
docker logs mariadb           # service logs
docker logs wordpress         # service logs
```
- A healthy stack shows three containers `Up` and NGINX responds on `https://aprado.42.fr`.