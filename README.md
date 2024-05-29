### README

# Django Project with Docker ( django-basic-setup )

This project is a basic Django setup using Docker, Docker Compose, and Nginx. Below are the steps to set up the environment from scratch.

## Prerequisites

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Configuration

### Docker Compose

The `docker-compose.yml` file defines three services:

- **db**: PostgreSQL database service.
- **web**: Django application service.
- **nginx**: Nginx service to handle HTTP requests.

### Dockerfile

The `Dockerfile` defines the environment for the Django application:

- Uses the `python:3.8-slim` base image.
- Sets the working directory to `/app`.
- Copies all files to the container.
- Installs dependencies from `requirements.txt`.
- Defines the entry script (`docker-entrypoint.sh`).

## How to Set Up the Environment

### 1. Clone the Repository

```sh
git clone https://github.com/CesarOvidioGutierrez/django-basic-setup.git
cd django-basic-setup
```

### 2. Build Docker Images

Before starting the services, you need to build the Docker images. Run the following command:

```sh
docker compose build
```

### 3. Start the Services

Once the images are built, you can start all services with the following command:

```sh
docker compose up
```

This command will start the containers for the PostgreSQL database, the Django application, and Nginx. You can access the application at `http://localhost`.

### 4. Apply Database Migrations

If this is the first time setting up the environment, you will need to apply the database migrations:

```sh
docker compose run web python manage.py migrate
```

## Useful Commands

- **Start services in the background:**

  ```sh
  docker compose up -d
  ```

- **Stop services:**

  ```sh
  docker compose down
  ```

- **View logs for a specific service:**

  ```sh
  docker compose logs <service_name>
  ```

- **Access a running container:**

  ```sh
  docker compose exec <service_name> /bin/bash
  ```

  Note: For the Nginx service, use sh instead of bash:

  ```sh
  docker compose exec <service_name> sh
  ```

### docker-entrypoint.sh

Make sure you have a `docker-entrypoint.sh` file with the appropriate execution permissions

## Notes

- Ensure that the `requirements.txt`, `nginx.conf`, and `docker-entrypoint.sh` files are in the root directory of the project.
- Modify the configurations as needed for your development environment.

And that's it! You now have a fully functional Django environment using Docker.
