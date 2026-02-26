## Clone Project and Setup Environment Variables

```sh

# ssh to server
ssh root@gtr-server


# cd to project directory
cd /root/gtr_server

#
git pull


# live log
SERVICE_NAME=gtr_server
# sudo systemctl restart ${SERVICE_NAME}.service
journalctl -u ${SERVICE_NAME} -f -o short-iso


```
