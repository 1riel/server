
# pull mongo image
docker pull mongo:latest


# run mongo container
CONTAINER_NAME=mongodb_product
export $(cat .env | xargs)
# MONGO_PORT
# MONGO_INITDB_ROOT_USERNAME
echo $MONGO_INITDB_ROOT_PASSWORD


docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
    --restart unless-stopped \
    --name $CONTAINER_NAME \
    -p 27027:27017 \
    -v /mnt/storage/mongo_product:/data \
    -v /mnt/storage/mongo_product/var/log/mongodb:/var/log/mongodb \
    -v /mnt/storage/mongo_product/etc/mongod.conf:/etc/mongod.conf \
    -e MONGO_INITDB_ROOT_USERNAME="$MONGO_INITDB_ROOT_USERNAME" \
    -e MONGO_INITDB_ROOT_PASSWORD="$MONGO_INITDB_ROOT_PASSWORD" \
    mongo:latest


