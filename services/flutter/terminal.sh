
SERVICE_NAME=1riel_server
systemctl restart ${SERVICE_NAME}.service
journalctl -u $SERVICE_NAME -f -o short-iso
