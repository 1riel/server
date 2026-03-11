# pull mongo image
docker pull nextcloud


CONTAINER_NAME=nextcloud
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    -v /mnt/storage/nextcloud:/var/www/html \
    -p 8080:80 \
    nextcloud