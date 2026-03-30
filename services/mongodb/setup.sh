
# pull mongo image
docker pull mongo:latest


# run mongo container
cd /root/1riel_server

docker stop mongodb
docker rm -f mongodb
docker run -d \
    --name mongodb \
    --restart unless-stopped \
    --env-file .env \
    -v /mnt/storage/mongodb/data:/data/db \
    -v /mnt/storage/mongodb/var/log/mongodb:/var/log/mongodb \
    -p 27017:27017 \
    mongo:latest