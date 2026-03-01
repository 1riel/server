# ssh to server
ssh root@gtr-server


# clone project from github to a specific directory
cd /root
git clone https://github.com/itcgtr/server.git gtr_server

# cd to project directory
cd /root/gtr_server


touch .env

# write environment variables to .env file

nano .env

# paste



# * LINUX
python3 -m venv .venv
source .venv/bin/activate


# * WINDOWS
python -m venv .venv
.venv\Scripts\activate


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