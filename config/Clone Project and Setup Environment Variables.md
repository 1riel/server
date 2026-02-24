## Clone Project and Setup Environment Variables

```sh

# ssh to server
ssh root@msl-t470


# clone project from github to a specific directory
cd /root
git clone https://github.com/1riel/server.git 1riel_server

# cd to project directory
cd /root/1riel_server


touch .env

# write environment variables to .env file

nano .env


```

## Setup Python Environment and Install Dependencies

```sh


# cd to project directory
cd /root/1riel_server


# create and activate a virtual environment
python3 -m venv .venv
source .venv/bin/activate


pip install fastapi[all]
pip install uvicorn
pip install pymongo
pip install minio
pip install requests

pip install pillow
pip install matplotlib
pip install python-telegram-bot

#
pip install opencv-python-headless
pip install insightface
pip install onnxruntime


# development dependencies
pip install jupyter
pip install ipdb



```
