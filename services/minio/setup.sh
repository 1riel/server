cd /root/1riel_server

# pull mongo image
docker pull minio/minio:latest



# run mongo container
CONTAINER_NAME=minio
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    --env-file .env \
    -v /mnt/storage/minio/data:/data \
    -v /mnt/storage/minio/var/log/minio:/var/log/minio \
    -p 9000:9000 \
    -p 9001:9001 \
    minio/minio:latest server /data --address ":9000" --console-address ":9001"


##########


# list all containers
docker ps -a

# stop container
CONTAINER_NAME=minio_product
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME