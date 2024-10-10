# docker-laravel

This is a Docker image for deploying Laravel easily to PaaS (platform-as-a-service) for my own usage. This image includes MySQL, Postgres, and SQLite for databases.

1. Github repo: https://github.com/raffiihza/docker-laravel
2. Docker Hub repo: https://hub.docker.com/r/raffiihza/docker-laravel

## How to use for private repositories (easier)
1. This method is intended for a private Laravel repository with `.env` included. Make sure that the repository uses an external database (or SQLite, but it's not recommended when using ephemeral storage) and can be run on your local machine before proceeding. If you insist on using a public repository or do not want to store `.env` in your repository, see the methods way below.
2. Create Dockerfile in your Laravel repository and change the port accordingly.
```
FROM raffiihza/docker-laravel

COPY . .

RUN composer install && npm install && npm run build
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
```
3. Use the repository as a deployment source in your preferred PaaS.
4. After deployed, add `APP_URL` environment variable and fill it with your app URL.

## How to use for public repositories or repositories without `.env` file (more complicated)
1. This method is intended for a Laravel repository without `.env` included. You will need to modify Dockerfile as per your requirements and set environment variables manually on the PaaS you're using.
2. Create Dockerfile in your Laravel repository (change the port accordingly).
```
FROM raffiihza/docker-laravel

COPY . .

RUN composer install && npm install && npm run build

### Please modify these commands as per your requirements and remove comment characters below
ENV APP_ENV=local
## Optional if you want to use some variables from the .env.example file without adding them manually to environment variables
# RUN cp .env.example .env
## Optional if you don't want to add APP_KEY env var manually
# RUN php artisan key:generate
## Optional if you want to use local SQLite
# RUN php artisan migrate -q
## Optional if you need a new storage link
# RUN php artisan storage:link

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
```
3. Use the repository as a deployment source in your preferred PaaS.
4. Add the necessary enviroment variables before deploying (it will replace related variables in `.env` if it's present in the build environment before), like `APP_KEY`, `DB_CONNECTION`, `DB_HOST`, etc (see `.env.example` file)
5. After deployed, add `APP_URL` environment variable and fill it with your app URL.

## How to build your own Docker image version (advanced)
Note: Do this if you really need other dependencies or something breaks somehow

1. Edit `Dockerfile` accordingly
2. Build your own Docker image version with `docker build -t <your-image>` command
3. Tag the image with Docker Hub repository with `docker tag <your-image> <user/image>:latest` command
4. Push the image to the Docker Hub repository with `docker push <user/image>:latest` command
5. After pushing, use that Docker Hub image instead of `raffiihza/docker-laravel`
