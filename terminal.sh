


SERVICE_NAME=1riel_server
sudo systemctl restart ${SERVICE_NAME}.service
journalctl -u ${SERVICE_NAME} -f -o short-iso


systemctl status ${SERVICE_NAME}.service