# pull mongo image
docker pull minio/minio:latest



# run mongo container
CONTAINER_NAME=minio_product
export $(cat .env | xargs)
echo $MINIO_PORT
echo $MINIO_CONSOLE_PORT
echo $MINIO_ROOT_USER
echo $MINIO_ROOT_PASSWORD


docker stop $CONTAINER_NAME
docker rm -f $CONTAINER_NAME
docker run -d \
  --restart unless-stopped \
  -p $MINIO_PORT:9000 \
  -p $MINIO_CONSOLE_PORT:9001 \
  --name $CONTAINER_NAME \
  -v /mnt/storage/minio_product/data:/data \
  -v /mnt/storage/minio_product/var/log/minio:/var/log/minio \
  -e "MINIO_ROOT_USER=$MINIO_ROOT_USER" \
  -e "MINIO_ROOT_PASSWORD=$MINIO_ROOT_PASSWORD" \
  minio/minio server /data --console-address ":9001"


