


SERVICE_NAME=gtr_telegram_stage
sudo systemctl restart ${SERVICE_NAME}.service
journalctl -u ${SERVICE_NAME} -f -o short-iso
