# pull mongo image
docker pull nextcloud

# list images
# docker images
# docker image prune -a


CONTAINER_NAME=nextcloud
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    -p 8080:80 \
    -v /mnt/storage/nextcloud:/var/www/html \
    nextcloud


# show all containers
docker ps -a


docker exec -it $CONTAINER_NAME bash
# exit

php occ config:system:set trusted_domains 1 --value=ftp.1riel.com
php occ config:system:set overwriteprotocol --value=https

# php occ config:system:get trusted_domains