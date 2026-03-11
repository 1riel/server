

# pull mongo image
docker pull minio/minio:latest



# run mongo container
cd /root/1riel_server
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

# create volume for minio data
docker volume create volume_minio

docker volume rm vscode

# list all volumes
docker volume ls

# remove unused volumes
docker volume prune -f


# list all containers
docker ps -a

# stop container
CONTAINER_NAME=minio
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME

# kill container
CONTAINER_NAME=minio
docker kill $CONTAINER_NAME

# reset docker permissions
sudo chown -R $USER:$USER /var/lib/docker

# reset docker permissions for minio data
sudo chown -R $USER:$USER /mnt/storage/minio/data