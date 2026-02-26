# cd to project directory
cd /root/1riel_server


# create and activate a virtual environment
python3 -m venv /.venv_fastapi_product
source /.venv_fastapi_product/bin/activate



# upgrade pip
python -m pip install --upgrade pip


pip install fastapi[all]
pip install uvicorn
pip install pymongo
pip install minio
pip install requests
pip install ipdb
pip install python-dotenv

pip install pillow
pip install matplotlib
pip install python-telegram-bot

#
pip install opencv-python-headless
pip install insightface
pip install onnxruntime


# development dependencies
pip install jupyter









# create systemd service
SERVICE_NAME=1riel_fastapi_product
WORKING_DIR=$(pwd)

cat <<EOF | tee /etc/systemd/system/${SERVICE_NAME}.service > /dev/null
[Unit]
Description=${SERVICE_NAME}_service
After=network.target

[Service]
User=root
Type=simple
WorkingDirectory=${WORKING_DIR}
ExecStart=/.venv_fastapi_product/bin/python -m uvicorn Application:app --host 127.0.0.1 --port 8000 --workers 4
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
