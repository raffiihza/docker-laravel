# docker-laravel

This is a Docker image for deploying Laravel easily to PaaS (platform-as-a-service) for my own usage. This image includes MySQL, Postgres, and SQLite for databases.

1. Github repo: https://github.com/raffiihza/docker-laravel
2. Docker Hub repo: https://hub.docker.com/repository/docker/raffiihza/docker-laravel

## How to use
1. This method is intended for a private Laravel repository with `.env` included. Make sure that the repository uses an external database (or SQLite, but it's not recommended when using ephemeral storage) and can be run on your local machine before proceeding. If you insist on using a public repository, clone it to a private one or adjust it accordingly (it may need many adjustments though).
2. Create Dockerfile in your Laravel repository (change the port accordingly).
```
FROM raffiihza/docker-laravel

COPY . .

RUN composer install
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
```
3. Use the repository as a deployment source in your preferred PaaS.
4. After deployed, add `APP_URL` environment variable and fill it with your app URL.

## How to build your own Docker image version (advanced)
Note: Do this if you really need other dependencies or something breaks somehow

1. Edit `Dockerfile` accordingly
2. Build your own Docker image version with `docker build -t <your-image>` command
3. Tag the image with Docker Hub repository with `docker tag <your-image> <user/image>:latest` command
4. Push the image to the Docker Hub repository with `docker push <user/image>:latest` command
5. After pushing, use that Docker Hub image instead of `raffiihza/docker-laravel`
