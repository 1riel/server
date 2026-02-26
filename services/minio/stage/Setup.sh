
# pull mongo image
docker pull minio/minio:latest


# run mongo container
CONTAINER_NAME=minio_stage
MINIO_PORT=9900
MINIO_CONSOLE_PORT=9901
MINIO_ROOT_USER="admin"
MINIO_ROOT_PASSWORD="adminadmin"


docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
  --restart unless-stopped \
  -p $MINIO_PORT:9000 \
  -p $MINIO_CONSOLE_PORT:9001 \
  --name $CONTAINER_NAME \
  -v /mnt/storage/minio_stage/data:/data \
  -v /mnt/storage/minio_stage/var/log/minio:/var/log/minio \
  -e "MINIO_ROOT_USER=$MINIO_ROOT_USER" \
  -e "MINIO_ROOT_PASSWORD=$MINIO_ROOT_PASSWORD" \
  minio/minio server /data --console-address ":9001"


