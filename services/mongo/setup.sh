
cd /root/1riel_server

# pull mongo image
docker pull mongo:latest


# run mongo container
CONTAINER_NAME=mongodb
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    --env-file .env \
    -v /mnt/storage/mongo:/data \
    -v /mnt/storage/mongo/var/log/mongodb:/var/log/mongodb \
    -v /mnt/storage/mongo/etc/mongod.conf:/etc/mongod.conf \
    -p 27017:27017 \
    mongo:latest



##########


# list all containers
docker ps -a

# stop container
CONTAINER_NAME=mongodb_product
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME