

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

docker stop mongo_developer
docker rm mongo_developer



cloudflared access tcp --hostname dev.codeshift.me --url 127.0.0.1:27018








### Install Tailscale

# update and upgrade system
apt-get update && apt-get upgrade -y


# install curl if not installed
apt-get install curl -y

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# start tailscale with login
tailscale up

# NOTE: follow the URL to login to your tailscale account










# setup tailscale.sh

systemctl enable tailscaled
systemctl start tailscaled
systemctl daemon-reload
systemctl status tailscaled


# install nmcli
apt-get install network-manager -y

# list wifi devices
nmcli device wifi list

# tailscale up --authkey tskey-auth-kTH63mEbZF11CNTRL-JWFpW6KEA3iB2eGUnnmK3iXhEobK5fdTS


### Install Cloudflare Tunnel


# Add cloudflare gpg key
mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add this repo to your apt repositories
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | tee /etc/apt/sources.list.d/cloudflared.list

# install cloudflared
apt-get update && apt-get install cloudflared

# [OPTIONAL] uninstall existing cloudflared service (if any)
cloudflared service uninstall


# [SYNTAX]: install cloudflared service with access tcp
cloudflared service install [TOKEN_HERE]

# reload cloudflared
systemctl daemon-reexec
systemctl daemon-reload
systemctl restart cloudflared
systemctl status cloudflared



