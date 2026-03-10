

# create and activate a virtual environment
python3 -m venv /.venv_telegram

source /.venv_telegram/bin/activate



# upgrade pip
python -m pip install --upgrade pip



# install required python packages
pip install ipdb
pip install python-dotenv
pip install python-telegram-bot
pip install python-dotenv
pip install ipdb




# create systemd service
SERVICE_NAME=1riel_telegram
WORKING_DIR=$(pwd)

cat <<EOF | tee /etc/systemd/system/${SERVICE_NAME}.service > /dev/null
[Unit]
Description=${SERVICE_NAME}_service
After=network.target

[Service]
User=root
Type=simple
WorkingDirectory=${WORKING_DIR}
ExecStart=/bin/bash -c 'source /.venv_server/bin/activate && python ${WORKING_DIR}/services/telegram_bot/Application.py'
StandardOutput=journal
StandardError=journal
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# start systemd
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable ${SERVICE_NAME}.service


# ExecStart=/.venv_fastapi_product/bin/python -m uvicorn Application:app --host 127.0.0.1 --port 8000 --workers 4


# remove service
SERVICE_NAME=1riel_telegram_stage
systemctl disable ${SERVICE_NAME}.service
systemctl stop ${SERVICE_NAME}.service
rm -rf /etc/systemd/system/${SERVICE_NAME}.service
systemctl daemon-reload