
# pull mongo image
docker pull mongo:latest


# run mongo container
cd /root/1riel_server
CONTAINER_NAME=mongodb
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    --env-file .env \
    -v /mnt/storage/mongodb/data:/data/db \
    -v /mnt/storage/mongodb/var/log/mongodb:/var/log/mongodb \
    -p 27017:27017 \
    mongo:latest



##########


# create volume for mongo data
docker volume create volume_mongodb

# delete volume
docker volume rm volume_mongodb

# list all volumes
docker volume ls

# remove unused volumes
docker volume prune -f


# list all containers
docker ps -a

# stop container
CONTAINER_NAME=mongodb_product
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME