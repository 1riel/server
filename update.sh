
# ssh to server
ssh root@msl-t470


# cd to project directory
cd /root/1riel_server

#
git pull


# live log
SERVICE_NAME=1riel_server
systemctl restart ${SERVICE_NAME}.service
journalctl -u ${SERVICE_NAME} -f -o short-iso



