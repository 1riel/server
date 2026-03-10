# pull mongo image
docker pull nextcloud


CONTAINER_NAME=nextcloud
docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
    --name $CONTAINER_NAME \
    --restart unless-stopped \
    -p 8080:80 \
    -v /mnt/storage/nextcloud:/var/www/html \
    nextcloud


docker logs -f nextcloud

# rm -rf /mnt/storage/nextcloud

docker exec -it nextcloud bash


php occ config:system:set trusted_domains 0 --value=msl-t470
php occ config:system:set trusted_domains 1 --value=ftp.1riel.com
php occ config:system:set overwrite.cli.url --value=https://ftp.1riel.com

php occ config:system:get trusted_domains


# delete the trusted_domains 2 entry if it exists
# php occ config:system:delete trusted_domains 2

# php occ config:system:delete overwriteprotocol
# php occ config:system:set overwriteprotocol --value=https


# php occ config:system:set trusted_proxies 0 --value=172.16.0.0/12



# 'trusted_domains' =>
# [
#  'localhost',
#  '192.168.1.10',
#  'cloud.example.com'
# ],

# 'overwrite.cli.url' => 'https://cloud.example.com',

# 'trusted_proxies' =>
# [
#  '172.16.0.0/12'
# ],
