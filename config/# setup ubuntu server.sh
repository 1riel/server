# setup ubuntu server


# goto super user mode
sudo su


### Update and Install Necessary Packages


# update and upgrade packages
apt update && apt upgrade -y

# install necessary packages
apt install -y build-essential curl git vim htop net-tools


# install python3-venv if not installed
apt install python3-venv python3-pip -y


### Install SSH Server

# install openssh-server
apt install openssh-server -y

# configure ssh to allow port 22 an d
nano /etc/ssh/sshd_config

# uncomment and set the following lines:
# Port 22
# ListenAddress 0.0.0.0
# or use sed command:
sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config

# in windows:  remove ssh hostkey in window os
# del C:\Users\your_user\.ssh\known_hosts



# check ssh service status
systemctl enable ssh
systemctl start ssh
systemctl status ssh

systemctl daemon-reexec
systemctl daemon-reload
systemctl restart ssh


# ssh test connections
ssh ains@ains-pi
ssh gtr@gtr-server
ssh msl@msl-server


########## OPTIONAL ##########

#
-i

# add root password
passwd

# configure ssh to allow root login
nano /etc/ssh/sshd_config
# PermitRootLogin yes


# list all service
# systemctl list-units --type=service


# restart ssh service
systemctl daemon-reload
systemctl restart ssh
# or
systemctl daemon-reload
systemctl restart sshd

