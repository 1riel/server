# Clone Project and Setup Environment Variables



# ssh to server
ssh root@msl-t470


# cd to project directory
cd /root/1riel_server

#
git pull
sudo systemctl restart 1riel_server.service

# live log
journalctl -u 1riel_server -f -o short-iso



