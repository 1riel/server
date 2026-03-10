


SERVICE_NAME=1riel_telegram_product
sudo systemctl restart ${SERVICE_NAME}.service
journalctl -u ${SERVICE_NAME} -f -o short-iso
