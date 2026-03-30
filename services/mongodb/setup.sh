
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
    -p 27017:27017 \
    mongo:latest

