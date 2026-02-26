

# create and activate a virtual environment
python3 -m venv /.venv_telegram_stage
source /.venv_telegram_stage/bin/activate

# upgrade pip
python -m pip install --upgrade pip

# install required python packages
pip install python-telegram-bot
pip install python-dotenv
pip install ipdb



# create systemd service
SERVICE_NAME=1riel_telegram_stage
WORKING_DIR=$(pwd)

cat <<EOF | tee /etc/systemd/system/${SERVICE_NAME}.service > /dev/null
[Unit]
Description=${SERVICE_NAME}_service
After=network.target

[Service]
User=root
Type=simple
WorkingDirectory=${WORKING_DIR}
ExecStart=/.venv_telegram_stage/bin/python ${WORKING_DIR}/services/telegram_bot/stage/Application.py
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
