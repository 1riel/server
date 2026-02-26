# setup tailscale

systemctl enable tailscaled
systemctl start tailscaled
systemctl daemon-reload
systemctl status tailscaled


# install nmcli
apt-get install network-manager -y

# list wifi devices
nmcli device wifi list

# tailscale up --authkey tskey-auth-kTH63mEbZF11CNTRL-JWFpW6KEA3iB2eGUnnmK3iXhEobK5fdTS


########## OPTIONAL ##########

