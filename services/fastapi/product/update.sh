
DIRECTORY=/root/1riel_server
SERVICE_NAME=1riel_server

cd $DIRECTORY
git pull
sudo systemctl restart $SERVICE_NAME.service