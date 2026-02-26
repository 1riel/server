# update and upgrade packages
apt update && apt upgrade -y


# install docker
apt install docker.io -y


# configure docker to start on boot
systemctl daemon-reload
systemctl enable docker
systemctl start docker