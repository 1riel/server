# setup ubuntu server


# goto super user mode
sudo su

# add root password
passwd


# update and upgrade packages
apt update && apt upgrade -y

# install necessary packages
apt install build-essential curl git -y

# install python3-venv if not installed
apt install python3-venv python3-pip -y


