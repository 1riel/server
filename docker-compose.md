# Docker Compose

```sh

# build and run all services in detached mode
docker-compose -f 'docker-compose.yml' up -d --build


# build and run only the mongo_product service in detached mode
docker-compose -f 'docker-compose.yml' up -d --build 'mongo_product'
docker-compose -f 'docker-compose.yml' up -d --build 'minio_product'
docker-compose -f 'docker-compose.yml' up -d --build 'telegram_product'


```
