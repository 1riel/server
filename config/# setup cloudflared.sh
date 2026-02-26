# setup cloudflared


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



