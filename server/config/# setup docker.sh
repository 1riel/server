# setup docker


# install docker
apt install docker.io -y

# reload docker service
systemctl daemon-reexec
systemctl daemon-reload

# enable docker service
systemctl enable docker
systemctl start docker
systemctl status docker


# list all docker containers
docker ps -a


docker stop mongo_7000
docker rm mongo_7000




########## OPTIONAL ##########





