# Clone Project and Setup Environment Variables



# ssh to server
ssh root@gtr-server


# cd to project directory
cd /root/1riel_server

#
git pull


# live log
SERVICE_NAME=1riel_server
sudo systemctl restart ${SERVICE_NAME}.service
journalctl -u ${SERVICE_NAME} -f -o short-iso



